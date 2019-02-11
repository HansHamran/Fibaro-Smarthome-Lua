--[[
%% properties
%% weather
%% events
648 CentralSceneEvent 1
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
if fibaro:countScenes() > 1 then fibaro:abort() end
 
  	-- Controlling is door is properly closed  (60 sec)
    local teller = 1
    while ( tonumber(fibaro:getValue(430, "value")) == 1 and teller < 60) do
    fibaro:sleep(1000)
    teller = teller + 1
    end
    -- Locking the door if it is closed but not locked
  	if ( tonumber(fibaro:getValue(430, "value")) == 0 and tonumber(fibaro:getValue(734, "value")) == 1)
    then 
    fibaro:call(753, "secure");
    end
    
end


 
