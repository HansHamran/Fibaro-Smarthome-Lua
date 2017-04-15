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
  -- Setter på Normalsyklus
	fibaro:call(135, "pressButton", "4"); --Stue
	fibaro:call(336, "pressButton", "4"); --Kjellergang
	fibaro:call(338, "pressButton", "4"); --Koffert
	fibaro:call(630, "pressButton", "4"); --Utebod

	fibaro:call(334, "pressButton", "4"); --Våtrom
  
    if fibaro:getGlobal("RomPlaymo") == "Bebodd"
    then
	fibaro:call(339, "pressButton", "4"); --Playmo syklus
    elseif fibaro:getGlobal("RomPlaymo") == "Kaldt"
    then fibaro:call(339, "pressButton", "2"); --Playmo sparing
    end
  
    if fibaro:getGlobal("RomSpill") == "Bebodd"
    then
  	fibaro:call(335, "pressButton", "4"); --Spillrom syklus
    elseif fibaro:getGlobal("RomSpill") == "Kaldt"
	then fibaro:call(335, "pressButton", "2"); --Spillrom sparing
    end

  	if fibaro:getGlobal("RomKatrine") == "Bebodd"
    then
	fibaro:call(627, "pressButton", "4"); --Katrine syklus
    elseif fibaro:getGlobal("RomKatrine") == "Kaldt"
	then fibaro:call(627, "pressButton", "2"); --Katrine sparing
    end
    
  	if fibaro:getGlobal("RomMari") == "Bebodd"
    then    
	fibaro:call(606, "pressButton", "2"); --Mari syklus
    elseif fibaro:getGlobal("RomMari") == "Kaldt"
	then fibaro:call(606, "pressButton", "3"); --Mari sparing
      end
      
    if fibaro:getGlobal("RomFanny") == "Bebodd"
    then   
	fibaro:call(607, "pressButton", "2"); --Fanny syklus
    elseif fibaro:getGlobal("RomFanny") == "Kaldt"
    then fibaro:call(607, "pressButton", "3"); --Fanny sparing
        end
        
  	if fibaro:getGlobal("RomForeldre") == "Bebodd"
    	then           
			fibaro:call(136, "pressButton", "2"); --Foreldrerom syklus
    	elseif fibaro:getGlobal("RomForeldre") == "Kaldt"
    	then fibaro:call(136, "pressButton", "3"); --Foreldrerom sparing
          end
          
	if fibaro:getGlobal("RomKontor") == "Bebodd"
      then
		fibaro:call(626, "pressButton", "4"); --Kontor syklus
    	elseif fibaro:getGlobal("RomKontor") == "Kaldt"
      then fibaro:call(626, "pressButton", "2"); --Kontor sparing
      end
end


