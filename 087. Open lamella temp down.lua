--[[
%% autostart
%% properties
30 value
%% events
%% globals
VentPersienne
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("AutoPersi") == "Ja"  
      and  fibaro:getGlobalValue("Persienne") == "0"  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei"  
      and  fibaro:getGlobalValue("VentPersienne") == "Release"  
      and  tonumber(fibaro:getValue(30, "value")) < 26 )
or
startSource["type"] == "other"
)
then
	fibaro:setGlobal("VentPersienne", "Hold");
	fibaro:call(74, "setValue2", "25");
	fibaro:call(76, "setValue2", "25");
	fibaro:call(661, "setValue2", "25");
	fibaro:setGlobal("Persienne", "25");
	setTimeout(function()
		fibaro:startScene(69);
	end, 900000)
end


