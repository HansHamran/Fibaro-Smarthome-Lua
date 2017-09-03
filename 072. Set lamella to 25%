--[[
%% autostart
%% properties
212 value
%% events
%% globals
AutoPersi
VentPersienne
Persienne
Persienneopp
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("AutoPersi") == "Ja"  
      and  fibaro:getGlobalValue("VentPersienne") == "Release"  
      and  fibaro:getGlobalValue("Persienne") == "35"  
      and  tonumber(fibaro:getValue(212, "value")) > 250  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei" )
or
startSource["type"] == "other"
)
then
	fibaro:call(74, "setValue2", "15");
	fibaro:call(76, "setValue2", "15");
	fibaro:call(661, "setValue2", "15");
	fibaro:setGlobal("Persienne", "25");
	fibaro:setGlobal("VentPersienne", "Hold");
	setTimeout(function()
		fibaro:startScene(69);
	end, 600000)
end


