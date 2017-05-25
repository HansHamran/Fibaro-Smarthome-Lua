--[[
%% properties
%% weather
%% events
278 CentralSceneEvent 6
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(54);
end


