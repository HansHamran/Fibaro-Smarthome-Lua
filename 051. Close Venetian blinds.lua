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
	fibaro:call(74, "close");
	fibaro:call(76, "close");
	fibaro:call(661, "close");
	fibaro:call(74, "setValue2", "0");
	fibaro:call(76, "setValue2", "0");
	fibaro:call(661, "setValue2", "0");
	fibaro:setGlobal("Persienne", "25");
	fibaro:call(74, "setValue2", "25");
	fibaro:call(76, "setValue2", "25");
	fibaro:call(661, "setValue2", "25");
end
