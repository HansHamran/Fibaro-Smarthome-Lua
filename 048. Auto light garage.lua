--[[
%% autostart
%% properties
641 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( tonumber(fibaro:getValue(641, "value")) > 0  
      and  tonumber(fibaro:getValue(643, "value")) < 150 
      and tonumber(fibaro:getValue(78, "value")) == 0)
or
startSource["type"] == "other"
)
then
  	if fibaro:countScenes() > 1 then fibaro:abort() end
	fibaro:call(78, "turnOn");
	fibaro:sleep(300000)
	fibaro:call(78, "turnOff");
end
