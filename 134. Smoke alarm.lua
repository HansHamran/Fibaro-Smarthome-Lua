--[[
%% properties
363 value
364 value
139 value
140 value
412 value
413 value
690 value
691 value
686 value
687 value
359 value
360 value
488 value
489 value
522 value
523 value
777 value
778 value
593 value
594 value
597 value
598 value
613 value
614 value
%% globals
--]]

-- IDs der Rauchmelder (Oben in den properties die IDs auch eintragen)
local smokeID = {613, 614, 593, 594, 597, 598, 363, 364, 139, 140, 412, 413, 690, 691, 686, 687, 359, 360, 488, 489, 522, 523, 777, 778}


-- Einstellungen für die Sirene(n) (Wenn keine IDs eingetragen sind, wird die Funktion nicht genutzt)
local sireneID = {367, 526, 530} -- ID der Sirene(n)

-- Einstellungen für Push-Benachrichtigungen (Wenn keine IDs eingetragen sind, wird die Funktion nicht genutzt)
local phoneID = {710, 711} -- ID der Handys

-- Einstellungen für Notfallbeleuchtung (Wenn keine IDs eingetragen sind, wird die Funktion nicht genutzt)
local lightID = {51, 55, 59, 63, 67, 71, 267, 176, 247, 251, 585, 152, 263, 189, 259, 255, 164, 271, 227, 275, 281, 289, 293, 379, 375} -- ID der Licht-Module

local countID = 500

-- AB HIER NICHTS MEHR ÄNDERN

-- Funktion zum Versenden der Push
function sendPush(text)
 if (phoneID[1] ~= nil) then
  for k=1, countID do
     if phoneID[k] ~= nil then
       fibaro:call(phoneID[k],'sendPush', text, 'smoke')
     end
  end
 end
end

-- Funktion zum Ein-/Ausschalten der Sirene
function onoffSirene(status)
 if (sireneID[1] ~= nil) then 
  if (status == 'true') then
   fibaro:debug('Sirene slått på')
   for a=1, countID do
     if sireneID[a] ~= nil then
       fibaro:call(sireneID[a],'turnOn')
     end
   end
  else
   if (sireneID[1] ~= nil) then  
    fibaro:debug('Sirene slått av')
    for a=1, countID do
      if sireneID[a] ~= nil then
        fibaro:call(sireneID[a],'turnOff')
      end
    end
   end
  end
 end
end

-- Funktion zum Ein-/Ausschalten der Notfallbeleuchtung
function emergencyLight(status)
 if (lightID[1] ~= nil) then 
  if (status == 'true') then
   fibaro:debug('Nødlys slått på')
   for l=1, countID do
     if lightID[l] ~= nil then
       fibaro:call(lightID[l],"setValue", "100")
     end
   end
  else
   if (lightID[1] ~= nil) then 
    fibaro:debug('Nødlys slått av')
    for l=1, countID do
      if lightID[l] ~= nil then
        fibaro:call(lightID[l],'turnOff')
      end
    end 
   end
  end
 end
end

-- Funktion für die Öffnung der Fluchtroute
function openEscapeRoute()
    fibaro:debug("Åpner persienner")
	fibaro:call(74, "open");
	fibaro:call(76, "open");
	fibaro:call(661, "open");
    fibaro:debug('Låser opp døra.')
	if ( tonumber(fibaro:getValue(430, "value")) == 0 and tonumber(fibaro:getValue(734, "value")) == 0)
    then
    fibaro:call(753, "unsecure");
	end
end

-- Fuksjon for å sjekke røykvarslere
function checkSmoke()
 fibaro:debug('En røykvarsler i Rabakken 5 er sikker. Sjekker de andre sensorene.')
 local smoke_counter = 0 
 for s=1, countID do
    if smokeID[s] ~= nil then
      if tonumber(fibaro:getValue(smokeID[s], "value")) == 1 then
        smoke_counter = smoke_counter+1
      end
    end
 end
 if (smoke_counter == 0) then
   fibaro:debug('Alle røykvarslere Rabakken 5 er sikre.')
   return true
 elseif (smoke_counter > 0) then
   fibaro:debug(smoke_counter..' Røykvarsler Rabakken 5 er ennå ikke sikret...')
   return false
 end
end

fibaro:debug('Røykalarm-HO versjon startet.')

local trigger = fibaro:getSourceTrigger()

if (trigger['type']=='property') then
  local smokeID = tonumber(trigger['deviceID'])
  local smoke = tonumber(fibaro:getValue(smokeID, "value"))
  local room = fibaro:getRoomNameByDeviceID(smokeID)
  if (smoke == 1 and fibaro:getGlobal("smoke_alarm") == 'false') then
  	fibaro:debug('Royk i: ' .. room .. ' er oppdaget.')
    fibaro:setGlobal("smoke_alarm", 'true')
    onoffSirene("true")
    emergencyLight("true")
    openEscapeRoute()
    
    local subject = "Rabakken5" -- passord SMS
  	local message = ("Roykalarm i Rabakken 5 i " ..room.. ".")
    fibaro:debug(message)
    sendPush(message)
    fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav

  elseif (smoke == 0 and fibaro:getGlobal("smoke_alarm") == 'true') then
    if checkSmoke() then
      fibaro:debug('Slår av røykalarm')
      fibaro:setGlobal("smoke_alarm", 'false')
      onoffSirene("false")
      emergencyLight("false")
      
      	local subject = "Rabakken5" -- passord SMS
  		local message = ("Alle roykvarslere i Rabakken 5 er sikret")
    	fibaro:debug(message)
    	sendPush(message)
    	fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    	fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    	fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav
      	
      	fibaro:startScene(54); -- kjører opp persienner så de blir nullstilt
        -- slår på lys i stue og gang
      	fibaro:startScene(63); -- lys stue
        fibaro:startScene(95); -- lys gang stue
        
      
    end
    
  elseif (smoke == 1 and fibaro:getGlobal("smoke_alarm") == 'true') then
        local subject = "Rabakken5" -- passord SMS
  		local message = ("Ytterligere en roykalarm Rabakken 5 i " ..room.. " har oppdaget royk.")
    	fibaro:debug(message)
    	sendPush(message)
    	fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    	fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    	fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav

  else
    fibaro:debug('Scenen ble utløst av en røykalarm. Oppdaget ingen røyk.')
    fibaro:setGlobal("smoke_alarm", "false")
  end
else
    local subject = "Rabakken5" -- passord SMS
  	local message = ("Roykalarmscenen i Rabakken 5 ble utlost manuelt.")
    fibaro:debug(message)
    sendPush(message)
    fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    fibaro:call(515, "sendEmail", subject, message); -- SMS Hans Olav
 
	fibaro:setGlobal("smoke_alarm", "false")
end




