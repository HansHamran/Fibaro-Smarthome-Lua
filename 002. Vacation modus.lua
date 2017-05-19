--[[
%% properties
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if
 ( startSource["type"] == "other"
)
then
	fibaro:setGlobal("Ferie", "Ja");
    -- setter ovner på sparing
	fibaro:call(135, "pressButton", "2"); -- Stue
	fibaro:call(336, "pressButton", "2"); -- Kjellergang
	fibaro:call(335, "pressButton", "2"); -- spillrom
	fibaro:call(338, "pressButton", "2"); -- Koffert
  	fibaro:call(630, "pressButton", "2"); -- Utebod
	fibaro:call(339, "pressButton", "2"); -- Playmo
  
	fibaro:call(334, "pressButton", "2"); -- Våtrom
  
  	fibaro:call(627, "pressButton", "2"); -- Katrine
	fibaro:call(606, "pressButton", "3"); -- Mari
  	fibaro:call(607, "pressButton", "3"); -- Fanny
  	fibaro:call(136, "pressButton", "3"); -- Foreldrerom
	fibaro:call(626, "pressButton", "2"); -- Kontor
end


