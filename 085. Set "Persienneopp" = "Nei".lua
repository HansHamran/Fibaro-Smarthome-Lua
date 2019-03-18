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
	fibaro:setGlobal("Persienneopp", "Nei");
end


