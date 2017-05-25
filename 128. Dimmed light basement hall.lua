--[[
%% autostart
%% properties
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();

if (
startSource["type"] == "other"
)
then
	fibaro:call(263, "setValue", "10");
	fibaro:call(152, "setValue", "10");
end
