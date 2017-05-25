--[[
%% properties
278 CentralSceneEvent 5
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
	fibaro:startScene(51);
end
