--[[
%% properties
%% events
278 CentralSceneEvent 2
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(63);
end
