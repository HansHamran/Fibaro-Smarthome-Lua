--[[
%% properties
%% weather
%% events
278 CentralSceneEvent 5
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
