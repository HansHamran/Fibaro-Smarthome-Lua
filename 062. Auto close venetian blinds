--[[
%% autostart
%% properties
700 value
706 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( tonumber(fibaro:getValue(700, "value")) > 5200 
      and tonumber(fibaro:getValue(706, "value")) > 5200
      and  fibaro:getGlobalValue("AutoPersi") == "Nei"  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei" )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(51);
	fibaro:setGlobal("AutoPersi", "Ja");
	fibaro:setGlobal("VentPersienne", "Hold");
	setTimeout(function()
		fibaro:startScene(69);
	end, 1800000)
end


