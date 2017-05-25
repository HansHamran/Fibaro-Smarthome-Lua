--[[
%% properties
%% events
%% globals
--]]


local startSource = fibaro:getSourceTrigger();
if (
startSource["type"] == "other"
)
then
	fibaro:call(263, "setValue", "30");
	fibaro:call(152, "setValue", "30");
	fibaro:call(169, "turnOn");
	fibaro:call(395, "turnOn");
	fibaro:call(375, "setValue", "50");
end
