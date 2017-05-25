--[[
%% properties
568 value
%% events
%% globals
--]]


-- Funktion for å slå av og på dummyrele (224)
function releWOnOff(status)
 --   fibaro:debug(status)
 if (status == 1) then
 --  	fibaro:debug('Dummyrele slås av')
   	fibaro:call(79,'turnOn')
 elseif (status == 0) then
--	fibaro:debug('Dummyrele slås på')
   	fibaro:call(79,'turnOff')
 end
end
-- sjekker om rele 12 (Nobø 1) har endret status


local trigger = fibaro:getSourceTrigger()

if (
	(trigger['type']=='property')
	) 
then
 -- 	fibaro:debug('Leser ny status rele')
    releWOnOff(tonumber(fibaro:getValue(568, "value"))
      )
end
