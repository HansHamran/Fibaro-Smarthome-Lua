--[[
%% properties
430 value
%% events
%% globals
Hjemmealarm
VenteHjemmeAlarm
NattogDag
--]]

local startSource = fibaro:getSourceTrigger();
if (
    (fibaro:getGlobalValue("Hjemmealarm") == "Ja")
	and (fibaro:getGlobalValue("VenteHjemmeAlarm") == "Ja")
    and (fibaro:getGlobalValue("NattogDag") == "Natt")
    and ( tonumber(fibaro:getValue(430, "value")) == 0 )
    or
	startSource["type"] == "other"
	)
then
    -- Låser ytterdøra hvis ulåst
	if ( tonumber(fibaro:getValue(430, "value")) == 0 and tonumber(fibaro:getValue(734, "value")) == 1)
    	then fibaro:call(753, "secure");
	end
  	-- sjekker at dørslå er i (gir det ett minutt)
	local teller = 1
  	while ( tonumber(fibaro:getValue(734, "value")) == 1 and teller < 60) do
    	fibaro:sleep(1000)
   		teller = teller + 1
    end
    if tonumber(fibaro:getValue(734, "value")) == 0
      	then
		-- fibaro:call(430, "setArmed", "1");
		fibaro:setGlobal("VenteHjemmeAlarm", "Nei")
    else
    	fibaro:call(176, "setValue", "100")
    end
end
    






