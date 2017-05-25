--[[
%% properties
278 CentralSceneEvent 4
%% weather
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(64);
end
