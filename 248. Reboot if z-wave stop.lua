--[[
%% autostart
%% properties
%% events
%% globals
RunClock
--]]


local startSource = fibaro:getSourceTrigger();
if (
 ( fibaro:getGlobalValue("RunClock") == "Ja" )
or
startSource["type"] == "other"

)
then
  		if fibaro:countScenes() > 1 then fibaro:abort() end
	
  		-- fibaro:debug("Zwavesum ".. fibaro:getGlobalValue("Zwavesum"));
  		fibaro:setGlobal("Zwavesum", 1)
		while fibaro:getGlobalValue("RunClock") == "Ja" do
    	
			local ZSUM = (100000000000*(
				(math.sqrt(fibaro:getValue(30, "value") 
    			)+math.sqrt(fibaro:getValue(211, "value")
				)+math.sqrt(fibaro:getValue(212, "value")
				)+math.sqrt(fibaro:getValue(365, "value")
				)+math.sqrt(fibaro:getValue(768, "value")
				)+math.sqrt(fibaro:getValue(772, "value")
				)+math.sqrt(fibaro:getValue(773, "value")
				)+math.sqrt(fibaro:getValue(490, "value")
				)+math.sqrt(fibaro:getValue(31, "value")
				)+math.sqrt(fibaro:getValue(746, "value")
				)+math.sqrt(fibaro:getValue(747, "value")
				)+math.sqrt(fibaro:getValue(130, "value")
				)+math.sqrt(fibaro:getValue(595, "value")
				)+math.sqrt(fibaro:getValue(602, "value")
				)+math.sqrt(fibaro:getValue(603, "value")
				)+math.sqrt(fibaro:getValue(116, "value")
				)+math.sqrt(fibaro:getValue(117, "value")
				)+math.sqrt(fibaro:getValue(114, "value")
				)+math.sqrt(fibaro:getValue(472, "value")
				)+math.sqrt(fibaro:getValue(599, "value")
				)+math.sqrt(fibaro:getValue(131, "value")
				)+math.sqrt(fibaro:getValue(414, "value")
				)+math.sqrt(fibaro:getValue(33, "value")
				)+math.sqrt(fibaro:getValue(401, "value")
				)+math.sqrt(fibaro:getValue(642, "value")
				)+math.sqrt(fibaro:getValue(643, "value")
				)+math.sqrt(fibaro:getValue(615, "value")
				)+math.sqrt(fibaro:getValue(32, "value")
				)+math.sqrt(fibaro:getValue(132, "value")
				)+math.sqrt(fibaro:getValue(133, "value")
				)+math.sqrt(fibaro:getValue(699, "value")
				)+math.sqrt(fibaro:getValue(700, "value")
				)+math.sqrt(fibaro:getValue(705, "value")
				)+math.sqrt(fibaro:getValue(706, "value")
				)+math.sqrt(fibaro:getValue(524, "value")
				)+math.sqrt(fibaro:getValue(328, "value")
				)+math.sqrt(fibaro:getValue(507, "value")
				)+math.sqrt(fibaro:getValue(692, "value")
				)+math.sqrt(fibaro:getValue(688, "value")
				)+math.sqrt(fibaro:getValue(327, "value")
				)+math.sqrt(fibaro:getValue(329, "value")
				)+math.sqrt(fibaro:getValue(361, "value")
				)+math.sqrt(fibaro:getValue(476, "value")
				)+math.sqrt(fibaro:getValue(779, "value")
        )))
    
    );
    			ZSUM = math.floor(ZSUM)
    
    			-- fibaro:debug("ZSUM ".. ZSUM);
   				-- fibaro:debug("Zwavesum ".. fibaro:getGlobalValue("Zwavesum"));
    			-- fibaro:debug(( tonumber(fibaro:getGlobalValue("Zwavesum")) - tonumber(ZSUM)));
 
				if
				( tonumber(fibaro:getGlobalValue("Zwavesum")) - tonumber(ZSUM) == 0)

						then
        				local melding = ("Z-wave henger Rabakken. Rebooter")
      						local subject = "Rabakken5"
  	 						fibaro:call(2, "sendEmail", "Z-wave stoppet", melding); -- Mail HO
    						fibaro:call(516, "sendEmail", subject, melding); -- SMS Hans Olav
							HomeCenter.SystemService.reboot();
      						fibaro:debug("Treff ");
      						fibaro:setGlobal("Zwavesum", 1)
      						fibaro:sleep(1*10*1000) -- hold 10 sek 
      						fibaro:startScene(218); -- boot system
      						fibaro:sleep(3*60*1000) -- hold 3 min
					else
							fibaro:setGlobal("Zwavesum", ZSUM )	
				end
		fibaro:sleep(5*60*1000) -- Sjekker hvert 5 minutt
		end

end
