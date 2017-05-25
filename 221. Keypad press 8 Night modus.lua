--[[
%% properties
%% weather
%% events
648 CentralSceneEvent 8
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(100);
end
