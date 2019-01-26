--[[
%% properties
%% weather
%% events
648 CentralSceneEvent 2
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( true )
or
startSource["type"] == "other"
)
then
if fibaro:countScenes() > 1 then fibaro:abort() end
  
   -- Activating intruder alarm
  -- Making sure main door is open and all other doors are closed
  	if ( tonumber(fibaro:getValue(430, "value")) == 1 -- main door
      	and tonumber(fibaro:getValue(24, "value")) == 0
        and tonumber(fibaro:getValue(639, "value")) == 0 
      	and tonumber(fibaro:getValue(422, "value")) == 0 
        and tonumber(fibaro:getValue(444, "value")) == 0)
 	then

    	-- Waiting for main door to be closed (60 sec)    
    	local teller = 1
    	while ( tonumber(fibaro:getValue(430, "value")) == 1 and teller < 60) do
    	fibaro:sleep(1000)
    	teller = teller + 1
    	end

    	-- locking door
	  	if ( tonumber(fibaro:getValue(430, "value")) == 0 and tonumber(fibaro:getValue(734, "value")) == 1)
	    then 
	    fibaro:call(731, "unsecure");
	    end
    
       	-- Making sure door lock is actually in before turing on intruder alarm
    	local teller = 1
    	while ( tonumber(fibaro:getValue(734, "value")) == 1 and teller < 60) do
    	fibaro:sleep(1000)
    	teller = teller + 1
    	end
    		if tonumber(fibaro:getValue(734, "value")) == 0
      		then
			fibaro:call(24, "setArmed", "1");
			fibaro:call(639, "setArmed", "1");
			fibaro:call(422, "setArmed", "1");
			fibaro:call(444, "setArmed", "1");
    		fibaro:call(210, "setArmed", "1");
			fibaro:call(343, "setArmed", "1");
			fibaro:call(745, "setArmed", "1");
			fibaro:call(601, "setArmed", "1"); 
      
      		-- Turning off all lightning
      
       		fibaro:call(55, "turnOff");
			fibaro:call(51, "turnOff");
			fibaro:call(59, "turnOff");
			fibaro:call(67, "turnOff");
			fibaro:call(71, "turnOff");
			fibaro:call(63, "turnOff");
			fibaro:call(267, "turnOff");
			fibaro:call(289, "turnOff");
			fibaro:call(293, "turnOff");
			fibaro:call(251, "turnOff");
			fibaro:call(247, "turnOff");
			fibaro:call(176, "turnOff");
			fibaro:call(585, "turnOff");
			-- fibaro:call(259, "turnOff");
			fibaro:call(263, "turnOff");
			fibaro:call(152, "turnOff");
			fibaro:call(189, "turnOff");
			fibaro:call(164, "turnOff");
			fibaro:call(255, "turnOff");
			fibaro:call(512, "turnOff");
			fibaro:call(296, "turnOff");
			fibaro:call(183, "turnOff");
			fibaro:call(349, "turnOff");
			fibaro:call(236, "turnOff");
			fibaro:call(240, "turnOff");
			fibaro:call(169, "turnOff");
			fibaro:call(244, "turnOff");
			fibaro:call(384, "turnOff");
			fibaro:call(167, "turnOff");
			fibaro:call(395, "turnOff");
      		fibaro:call(183, "turnOff");
			fibaro:call(185, "turnOff");
			fibaro:call(375, "turnOff");
			fibaro:call(379, "turnOff");
			fibaro:call(281, "turnOff");
			fibaro:call(275, "turnOff");
			fibaro:call(271, "turnOff");
      
                 if fibaro:getGlobal("MorgenLysKjokken") ~= "Venter" then
			    fibaro:setGlobal("MorgenLysKjokken", "Venter") end
      
      			if fibaro:getGlobal("Kveldslysstue") ~= "Venter" then
			    fibaro:setGlobal("Kveldslysstue", "Venter") end
  
    		-- Turning on simulating presence
    		fibaro:call(137, "pressButton", "3"); 
      		-- Turning on camera
      		fibaro:call(479, "turnOn")
      
      
        	-- Turning off heating in living room
      			if fibaro:getGlobalValue("Ferie") == "Nei"
    			then
  				fibaro:call(135, "pressButton", "4"); -- Normal syklus
        		fibaro:setGlobal("HoldStueVarme", "Nei");
        		else
          		fibaro:call(135, "pressButton", "2"); -- Sparing
        		fibaro:setGlobal("HoldStueVarme", "Nei");
    			end
      		-- Setter Nobø 2, Maris rom
      		    if 	fibaro:getGlobal("RomMari") == "Kaldt"
        			or fibaro:getGlobalValue("Ferie") == "Ja"
		    	then
		  		fibaro:call(606, "pressButton", "3"); -- Sparing
        		else
        		fibaro:call(606, "pressButton", "2"); -- Syklus
				end
      
      		-- Setter Nobø 3, Fannys rom
            	if 	fibaro:getGlobal("RomFanny") == "Kaldt"
        			or fibaro:getGlobalValue("Ferie") == "Ja"
		    	then
		  		fibaro:call(607, "pressButton", "3"); -- Sparing
        		else
        		fibaro:call(607, "pressButton", "2"); -- Syklus
				end
      
           -- Setter varme Katrines rom
            	if 	fibaro:getGlobal("RomKatrine") == "Kaldt"
        			or fibaro:getGlobalValue("Ferie") == "Ja"
		    	then
		  		fibaro:call(627, "pressButton", "2"); -- Sparing
        		else
        		fibaro:call(627, "pressButton", "4"); -- Syklus
				end      
      
           -- Setter varme Kontor
            	if 	fibaro:getGlobal("RomKontor") == "Kaldt"
        			or fibaro:getGlobalValue("Ferie") == "Ja"
		    	then
		  		fibaro:call(626, "pressButton", "2"); -- Sparing
        		else
        		fibaro:call(626, "pressButton", "4"); -- Syklus
				end
      
            -- Setter varme Foreldre
            	if 	fibaro:getGlobal("RomForeldre") == "Kaldt"
        			or fibaro:getGlobalValue("Ferie") == "Ja"
		    	then
		  		fibaro:call(136, "pressButton", "3"); -- Sparing
        		else
        		fibaro:call(136, "pressButton", "2"); -- Syklus
				end

      
      		fibaro:debug("Alarm is turned on")
      
      			if ( fibaro:getGlobalValue("Ferie") == "Ja" and tonumber(fibaro:getValue(656, "value")) > 0 )
				then 
        		
        		fibaro:debug("Water is closed");
        		fibaro:call(656, "turnOff");
				end
    		end
    else
    		fibaro:call(367, "turnOn");
    		fibaro:sleep(10);
    		fibaro:call(367, "turnOff");
    		fibaro:sleep(10);
        	fibaro:call(367, "turnOn");
    		fibaro:sleep(10);
    		fibaro:call(367, "turnOff");
      		fibaro:debug("Alarm kunne ikke slås på.")
	end
  end
