--[[
%% properties
%% events
278 CentralSceneEvent 7
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
	if tonumber(fibaro:getValue(267, "value")) > 0
    then
    fibaro:call(267, "turnOff")
    else
  	fibaro:call(267, "setValue", "100")
    end
end
