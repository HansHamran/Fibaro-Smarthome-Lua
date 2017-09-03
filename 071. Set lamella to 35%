--[[
%% autostart
%% properties
212 value
7 power
%% events
%% globals
VentPersienne
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("AutoPersi") == "Ja"  
      and  fibaro:getGlobalValue("VentPersienne") == "Release"  
      and  fibaro:getGlobalValue("Persienne") == "25"  
      and  tonumber(fibaro:getValue(212, "value")) < 150  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei"  
      and  tonumber(fibaro:getValue(7, "power")) < 20 )
or
startSource["type"] == "other"
)
then
	fibaro:call(74, "setValue2", "35");
	fibaro:call(76, "setValue2", "35");
	fibaro:call(661, "setValue2", "35");
	fibaro:setGlobal("Persienne", "35");
	fibaro:setGlobal("VentPersienne", "Hold");
	setTimeout(function()
		fibaro:startScene(69);
	end, 600000)
end
