--[[
%% autostart
%% properties
745 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if fibaro:countScenes() > 1 then fibaro:abort() end
if (
 ( tonumber(fibaro:getValue(745, "value")) > 0  
      and  tonumber(fibaro:getValue(747, "value")) < 250   
      and  fibaro:getGlobalValue("AutolysOFF") == "Nei"  
      and  tonumber(fibaro:getValue(263, "value")) <= 34  
      and  tonumber(fibaro:getValue(152, "value")) <= 34 
    )
or
startSource["type"] == "other"
)
then
  	fibaro:startScene(127);
    	fibaro:sleep(600000)
    	while tonumber(fibaro:getValue(745, "value")) > 0 do
    	fibaro:sleep(600000)
    	end
  
		if (fibaro:getGlobalValue("AutolysOFF") == "Nei"
    	and fibaro:getGlobalValue("Simu_presence") == "Off")
    	then
  			fibaro:startScene(128);
    	end
end



