--[[
%% autostart
%% properties
%% events
%% globals
RunClock
--]]


local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("RunClock") == "Ja" )
or
startSource["type"] == "other"

)
then
  		if fibaro:countScenes() > 1 then fibaro:abort() end
  		--fibaro:debug(fibaro:getGlobalValue("Foreldretemp"));
  		fibaro:setGlobal("Foreldretemp", 1)
		while fibaro:getGlobalValue("RunClock") == "Ja" do
			local difference = fibaro:getValue(131, "value")-fibaro:getValue(414, "value")
			--fibaro:debug(difference)
				if
				( tonumber(fibaro:getGlobalValue("Foreldretemp")) == tonumber(fibaro:getValue(131, "value"))
      			and (
				(tonumber(difference) > 2 or tonumber(difference) < -2)) 
      			)
						then
        					local melding = ("Foreldretemp er låst på " .. fibaro:getValue(131, "value") .. " grader. Røyktemp er " .. fibaro:getValue(414, "value") .. " grader.")
								fibaro:call(710,'sendPush', melding); -- HO mobil
  	 							fibaro:call(2, "sendEmail", "Låst temp", melding); -- Mail Hans Olav
								
					else
							fibaro:setGlobal("Foreldretemp", tonumber(fibaro:getValue(131, "value")) )	
				end
		fibaro:sleep(2*60*60000)
		end

end
