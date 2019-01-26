--[[
%% autostart
%% properties
667 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if fibaro:countScenes() > 1 then fibaro:abort() end
if (
 ( tonumber(fibaro:getValue(745, "value")) > 0  
      and  fibaro:getGlobalValue("AutolysOFF") == "Ja"  
      and  fibaro:getGlobalValue("SunSet") == "Ja"  
      and  tonumber(fibaro:getValue(747, "value")) < 50  
      and  tonumber(fibaro:getValue(263, "value")) == 0  
      and  tonumber(fibaro:getValue(152, "value")) == 0  
      )
or
startSource["type"] == "other"
)
then
	fibaro:call(263, "setValue", "15");
	fibaro:call(152, "setValue", "15");
	fibaro:call(375, "setValue", "15");
	fibaro:sleep(600000);
	fibaro:call(263, "turnOff");
	fibaro:call(152, "turnOff");
	fibaro:call(375, "turnOff");
end
