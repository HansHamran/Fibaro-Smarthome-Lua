--[[
%% properties
%% events
%% globals
--]]


local startSource = fibaro:getSourceTrigger();
if (
startSource["type"] == "other"
)
then
	fibaro:setGlobal("Persienneopp", "Ja");
	fibaro:setGlobal("Persienne", "100");
	fibaro:call(74, "setValue2", "100");
	fibaro:call(76, "setValue2", "100");
	fibaro:call(661, "setValue2", "100");
	fibaro:setGlobal("AutoPersi", "Nei");
	fibaro:setGlobal("VentPersienne", "Release");
	fibaro:call(74, "open");
	fibaro:call(76, "open");
	fibaro:call(661, "open");
	setTimeout(function()
		fibaro:startScene(85);
      -- Etter 120000 kjøres scenen "persienne opp av"
	end, 120000)
end


