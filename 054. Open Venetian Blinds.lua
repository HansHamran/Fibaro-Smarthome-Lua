--[[
%% autostart
%% properties
700 value
706 value
212 value
699 value
705 value
%% events
%% globals
VentPersienne
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( tonumber(fibaro:getValue(700, "value")) < 1200  
      and tonumber(fibaro:getValue(706, "value")) < 1200
      and  tonumber(fibaro:getValue(212, "value")) < 250  
      and  tonumber(fibaro:getValue(699, "value")) < 30
      and  tonumber(fibaro:getValue(705, "value")) < 30
    )
and
 ( fibaro:getGlobalValue("AutoPersi") == "Ja"  
      and  fibaro:getGlobalValue("VentPersienne") == "Release"  
      and  fibaro:getGlobalValue("Persienneopp") == "Nei" )
or
startSource["type"] == "other"
)
then
	fibaro:startScene(54);
end


