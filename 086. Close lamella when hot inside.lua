--[[
%% autostart
%% properties
30 value
%% events
%% globals
VentPersienne
Persienne
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("AutoPersi") == "Ja"  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei"  
      and  fibaro:getGlobalValue("VentPersienne") == "Release"  
      and  tonumber(fibaro:getValue(700, "value")) > 7000  
      and  tonumber(fibaro:getValue(706, "value")) > 7000 
      and  tonumber(fibaro:getValue(30, "value")) > 27  
      and  fibaro:getGlobalValue("Persienne") ~= "0" )
or
startSource["type"] == "other"
)
then
	fibaro:setGlobal("Persienne", "0");
	fibaro:call(74, "setValue2", "0");
	fibaro:call(76, "setValue2", "0");
	fibaro:call(661, "setValue2", "0");
	fibaro:setGlobal("VentPersienne", "Hold");
	setTimeout(function()
		fibaro:startScene(69);
	end, 900000)
end


