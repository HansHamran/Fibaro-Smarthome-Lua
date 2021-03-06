--[[
%% properties
%% globals
--]]

-- Bevegelsesdektorer og dør/vindusensorer
local sensorID = {24,430,639,422,444,210,771,745,481}

-- Sirene
-- local sireneID = {349} -- LYS test
local sireneID = {367, 526, 530} -- ID Siren(n)

-- Push melding sendes til mobil under
local phoneID = {710, 711} -- ID der Handys

local countID = 500


Debug = function ( color, message )
  fibaro:debug(string.format('<%s style="color:%s;">%s</%s>', "span", color, message, "span"))
end

-- Funktion zum Versenden der Push
function sendPush(text)
 if (phoneID[1] ~= nil) then
  for k=1, countID do
    if phoneID[k] ~= nil then
       fibaro:call(phoneID[k],'sendPush', text, 'alarm')
     end
	end
   end
 end

-- Funksjon for å slå av og på sirene
function onoffSirene(status)
 if (sireneID[1] ~= nil) then 
  if (status) then
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

function checkSensorArmed()
  local armed_counter = 0 
  for j=1, countID do
    if sensorID[j] ~= nil then
      if (tonumber(fibaro:getValue(sensorID[j], 'armed')) == 1) then
         armed_counter = armed_counter+1
      end
    end
  end
  if (armed_counter == 0) then
   return false
  elseif (armed_counter > 0) then
   fibaro:debug(armed_counter..' Sensorer er ennå ikke slått av ...')
   return true
 end
end

local startSource = fibaro:getSourceTrigger();
if (
startSource["type"] == "other"
)
then

	Debug( 'red', 'Innbruddsalarm er utløst.')
  	fibaro:setGlobal("Innbruddsalarm", "true")

  	local subject = "Rabakken5" -- passord SMS
  	local message = "Innbruddsalarm hos Hamran/Nordhagen i Rabakken 5, 0880 Oslo."
    Debug( "red", message)
    sendPush(message)
    fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav

	fibaro:call(97, "sendPhotoToUser", "2"); -- utekamera

	onoffSirene(true)

    fibaro:debug("Åpner persienner")
	fibaro:setGlobal("Persienne", "100");
	fibaro:call(74, "setValue2", "100");
	fibaro:call(76, "setValue2", "100");
	fibaro:call(661, "setValue2", "100");
	fibaro:call(74, "open");
	fibaro:call(76, "open");
	fibaro:call(661, "open");

	while checkSensorArmed() do
	  Debug( 'red', 'Alarm er fremdeles aktivert.')
	  fibaro:sleep(10000)
	end
	onoffSirene(false);

  	local subject = "Rabakken5"
  	local message = "Innbruddalarm hos Hamran/Nordhagen i Rabakken 5, 0880 Oslo er utkoblet."
    Debug("white", message)
    sendPush(message)
    fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
    fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav
    
    if fibaro:getGlobal("MorgenLysKjokken") ~= "Venter" then
	fibaro:setGlobal("MorgenLysKjokken", "Venter") end
 
      if fibaro:getGlobal("Kveldslysstue") ~= "Venter" then
	fibaro:setGlobal("Kveldslysstue", "Venter") end
  
  	if fibaro:getGlobal("HoldStueVarme") ~= "Nei" then
    fibaro:setGlobal("HoldStueVarme", "Nei") end

	fibaro:startScene(172); -- Kjører on-off clock
    fibaro:setGlobal("Innbruddsalarm", "false")
  	fibaro:setGlobal("Simu_presence", "Off")

	fibaro:startScene(54); -- kjører opp persienne så denne blir normal

 
	Debug("white", "Alarm avsluttet")

end



