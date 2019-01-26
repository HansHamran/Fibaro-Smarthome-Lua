--[[
%% properties
734 value
430 armed
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if fibaro:countScenes() > 1 then fibaro:abort() end
if (
 ( tonumber(fibaro:getValue(734, "value")) > 0 and ( tonumber(fibaro:getValue(24, "armed")) > 0 )) 
    -- Sjekker om låsebolt låses opp og verandadør oppe har alarmen på
or
startSource["type"] == "other"
)
then
  	if (( fibaro:getGlobalValue("Hjemmealarm") == "Ja" and fibaro:getGlobalValue("NattogDag") == "Natt")
    and (startSource["type"] ~= "other"))
    then
    -- Aksjon når døra lukkes opp om natta og alarmen stor på hjemmealarm
    -- slår av alarm på utgangssdør
    fibaro:call(430, "setArmed", "0");
    fibaro:setGlobal("VenteHjemmeAlarm", "Vent")
    fibaro:debug("Slått av hovedør og satt på ventealarm")
    else
	-- Slå av alt
	fibaro:call(24, "setArmed", "0");
	fibaro:call(430, "setArmed", "0");
	fibaro:call(639, "setArmed", "0");
	fibaro:call(422, "setArmed", "0");
	fibaro:call(444, "setArmed", "0");
	fibaro:call(641, "setArmed", "0");
	fibaro:call(210, "setArmed", "0");
	fibaro:call(343, "setArmed", "0");
	fibaro:call(745, "setArmed", "0");
    fibaro:call(601, "setArmed", "0"); 
  	-- Slår av kamera
	fibaro:call(479, "turnOff");
  	-- Slår av lysorgel
	fibaro:call(137, "pressButton", "4");
    
    if fibaro:getGlobalValue("NattogDag") == "Dag"
      then
    
	-- Setter Nobø 2, Mari på Comfort
		    if fibaro:getGlobal("RomMari") == "Bebodd"
        	and fibaro:getGlobalValue("Ferie") == "Nei"
		    	then
		  		fibaro:call(606, "pressButton", "4"); -- Comfort
			end
      		-- Setter Nobø 3, Fanny på normal syklus
      		if fibaro:getGlobal("RomFanny") == "Bebodd"
        	and fibaro:getGlobalValue("Ferie") == "Nei"
		    	then
		  		fibaro:call(607, "pressButton", "4"); -- Comfort
			end
      		-- Rom Katrine på comfort
            if fibaro:getGlobal("RomKatrine") == "Bebodd"
        	and fibaro:getGlobalValue("Ferie") == "Nei"
		    	then
		  		fibaro:call(627, "pressButton", "3"); -- Comfort
			end
      
            -- Rom Kontor på comfort
            if fibaro:getGlobal("RomKontor") == "Bebodd"
        	and fibaro:getGlobalValue("Ferie") == "Nei"
		    	then
		  		fibaro:call(626, "pressButton", "3"); -- Comfort
			end
    end
    
  	-- Åpner kran om ferie er årsak til at den er lukket
  	fibaro:debug("Alarm er slått av")
  		if ( fibaro:getGlobalValue("Ferie") == "Ja" and tonumber(fibaro:getValue(656, "value")) == 0 
        and fibaro:getGlobalValue("Vannlekkasje") == "Nei")
			then 
        	fibaro:call(656, "turnOn");
        	fibaro:debug("Hovedkran er åpnet");
		end
    fibaro:setGlobal("VenteHjemmeAlarm", "Nei")
    fibaro:setGlobal("Hjemmealarm", "Nei")
    end
end

