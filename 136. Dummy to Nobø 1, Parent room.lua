--[[
%% properties
224 value
%% events
%% globals
--]]


-- Funktion for å slå av og på nobørele (12)
function releWOnOff(status)
 --   fibaro:debug(status)
 if (status == 1) then
 --  	fibaro:debug('Nobø slås av')
   	fibaro:call(566,'turnOn')
 elseif (status == 0) then
--	fibaro:debug('Nobø slås på')
   	fibaro:call(566,'turnOff')
 end
end
-- sjekker om rele Nobø 1 har endret status


local trigger = fibaro:getSourceTrigger()

if (
	(trigger['type']=='property')
	) 
then
 -- 	fibaro:debug('Leser ny status rele')
    releWOnOff(tonumber(fibaro:getValue(224, "value"))
      )
end
