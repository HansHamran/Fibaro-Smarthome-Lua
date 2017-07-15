--[[
%% autostart
%% properties
470 value
474 value
505 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( tonumber(fibaro:getValue(470, "value")) > 0  or  tonumber(fibaro:getValue(474, "value")) > 0
    or  tonumber(fibaro:getValue(505, "value")) > 0)
or
startSource["type"] == "other"
)
then
    if (startSource["type"] == "property")
  	then
  		local sensorID = tonumber(startSource["deviceID"])
  		local room = fibaro:getRoomNameByDeviceID(sensorID)
  		local descr = fibaro:getValue(sensorID, "userDescription")
      
  		local subject = "Rabakken5" -- passord SMS
  		local message = "Vannlekkasje i Rabakken 5, " ..descr.. " (" ..room.. ") er oppdaget."
    	fibaro:debug(message)
    	fibaro:call(448, "sendPush", message) -- HOs mobil
    	fibaro:call(102, "sendPush", message) -- marits mobil
    	fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
   		fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    	fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav
 	end
  
  	-- lukker krana om denne er åpen
	if ( tonumber(fibaro:getValue(656, "value")) > 0 )
		then
		fibaro:call(656, "turnOff");
	end
  
  	fibaro:setGlobal("Vannlekkasje", "Ja");
    
    
    -- sjekker at hovedkran faktisk ble lukket
    	local teller = 1
    	while ( tonumber(fibaro:getValue(656, "value")) > 0 and teller < 60) do
    	fibaro:sleep(1000)
    	teller = teller + 1
    	end
    	if tonumber(fibaro:getValue(656, "value")) == 0
      	then
      		local subject = "Rabakken5" -- passord SMS
  			local message = "Vannlekkasje i Rabakken 5. Hovedkran er automatisk stengt."
        	fibaro:debug(message)
    		fibaro:call(448, "sendPush", message) -- HOs mobil
    		fibaro:call(102, "sendPush", message) -- marits mobil
    		fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
   			fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    		fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav
      	else
      		local subject = "Rabakken5" -- passord SMS
  			local message = "Vannlekkasje i Rabakken 5. Hovedkran kunne IKKE stenges. Noe gikk galt."
            fibaro:debug(message)
    		fibaro:call(448, "sendPush", message) -- HOs mobil
    		fibaro:call(102, "sendPush", message) -- marits mobil
    		fibaro:call(2, "sendEmail", subject, message); -- Mail Hans Olav
   			fibaro:call(515, "sendEmail", subject, message); -- SMS Nokas
    		fibaro:call(516, "sendEmail", subject, message); -- SMS Hans Olav
      	end
        
  	fibaro:setGlobal("Lydvarsel", "På")
  	fibaro:sleep(100)
    while fibaro:getGlobalValue("Lydvarsel") == "På" do
    	fibaro:call(367, "turnOn");
    	fibaro:sleep(10)
   	 	fibaro:call(367, "turnOff");
  		fibaro:sleep(600000);
	end
end




