     --[[
    %% autostart
    %% properties
    %% globals
    Simu_presence
    SunSet
    --]]


    -- LUA - Presence Simulator at Home
      -- A part of code is reused, it can found here. Thanx to Richo: http://forum.fibaro.com/viewtopic.php?t=1892&postdays=0&postorder=asc&highlight=presence&start=15


    --------------------- USER SETTINGS --------------------------------


    local stop_hour = "23";                             -- Hour when you want simulation to stop. PS Cannot after midnight
    local stop_minute = "45";                      -- Minute of the hour you want simulation to stop
    local rndmaxtime = 20                                -- random time of light change in minutes --> here each device is on max 20min
    local ID_devices_lights = {51, 55, 71, 63, 67, 247, 259, 227, 512, 275, 289}                 -- IDs of lights to use in simulation
    local activatePush = true;                          -- activate push when simulation starts and stops
    local ID_Smartphone = 710;                           -- ID of your smartphone   


    -- 3 variable needed, Simu_presence(predefined ("On" and "Off") and overrideSimuSunset ("0" and "1") and SunSet ("Ja" and "Nei")


    local startSource = fibaro:getSourceTrigger();
    local showStandardDebugInfo = true;             -- Debug shown in white
    local numbers_lights = #ID_devices_lights;          --numbers of light devices listed above
    local simu = fibaro:getGlobal("Simu_presence");      --value of the global value: simulation is on or off
	local SunSet = fibaro:getGlobal("SunSet");      --value of the global value: SunSet is on or off
    --------------------------------------------------------------------


     
    local sunsetHour = fibaro:getValue(1, "sunsetHour"); 
    local minute = 60000; --in milliseconds
    local start = os.date("%H:%M");
    local time = os.time();
    local date = os.date("*t", time);
    local year = date.year;
    local month = date.month;
    local day = date.day;
    local endtime = os.time{year=year, month=month, day=day, hour=stop_hour, min=stop_minute, sec=sec}
    local version = "2.0"

	if fibaro:countScenes() > 1 then fibaro:abort() end


    SimulatorPresenceEngine = {};

    -- debug function
    Debug = function ( color, message )
      fibaro:debug(string.format('<%s style="color:%s;">%s</%s>', "span", color, message, "span"));
    end

    StandardDebug = function (debugMessage)
     if ( showStandardDebugInfo ) then
        Debug( "white", debugMessage);   
      end
    end

    -- function push message to mobile
    pushMessage = function (text)
        if (activatePush) then
           StandardDebug("Push info sent to mobile")
           fibaro:call(ID_Smartphone, 'sendPush', text);
        end
    end
           

    -- function to switch off devices in the list
    function SimulatorPresenceEngine:TurnOff(group)
     -- pushMessage("Lights simulation stopped as past stop hour or simply turned off. TurnOff lights!")
     -- StandardDebug("Lights simulation stopped as past stop hour or simply turned off. TurnOff lights!")
      local name, id;
      local ID_devices_group = group;
        for i=1, #ID_devices_group do
        id = tonumber(ID_devices_group[i]);
        fibaro:call(id, "turnOff");
            name = fibaro:getName(id);
                 if (name == nil or name == string.char(0)) then
                 name = "Unknown"
                 end
              -- StandardDebug("Device:" .. name .. " Off ");
           
        end
    end

    -- function to simulate a presence 
    function SimulatorPresenceEngine:Launch()
       if (os.time() >= endtime) or (fibaro:getGlobal("Simu_presence") == "Off") or (fibaro:getGlobal("SunSet") == "Nei") or (os.date("%H:%M", os.time()) <= fibaro:getValue(1,'sunriseHour')) then
    	  -- PushMessage("Stopped by B")
    	  -- StandardDebug("Stopped by B")
			if  tonumber(fibaro:getValue(639, "armed")) > 0 
        	then
      		SimulatorPresenceEngine:TurnOff(ID_devices_lights)
        	end
       	end

       while ((os.time() <= endtime) and (simu == "On") and (SunSet == "Ja") and (os.date("%H:%M", os.time()) >= fibaro:getValue(1,'sunriseHour'))) do
       -- if time == endtime then StandardDebug("same value") end
      		-- pop some random number to get real random later as random is not really working
    		math.randomseed( os.time() );
			math.random(); math.random(); math.random();
            local random_light = tonumber(ID_devices_lights[math.random(numbers_lights)]) --choose a random light in the list
            local lightstatus = fibaro:getValue(random_light, 'value') --get the value of the random light in the list
            -- turn on the light if off or turn off if on
            if  tonumber(lightstatus) == 0 then fibaro:call(random_light, 'turnOn') else fibaro:call(random_light, 'turnOff') end
              fibaro:sleep(2000) ; --necessary to get back the new status, because HC2 is too fast :-)
            lightstatus = fibaro:getValue(random_light, 'value') --get the value of the random light after his update
            --StandardDebug('light ID:'..random_light..' status:'..lightstatus)
    		--pushMessage("Lights simulation with " .. fibaro:getName(random_light) .. "status changed to: " ..lightstatus)
    		-- pop some random number to compensate for lack of random functionality
    		math.randomseed( os.time() );
			math.random(); math.random(); math.random();
            local sleeptime = math.random(rndmaxtime*minute) --random sleep
            local sleeptimemin = math.abs(sleeptime/60000)
        	--pushMessage("Hold it for min: " .. sleeptimemin)
            --StandardDebug('sleeptime:'..sleeptimemin)
            fibaro:sleep(sleeptime)
            simu = fibaro:getGlobal("Simu_presence"); --verify the global value, if the virtual device is deactivated, the scene stops.
    		SunSet = fibaro:getGlobal("SunSet"); --verify the global value, if the sunset is deactivated, the scene stops.
        end
        --turn Off all lights
        --pushMessage("Stopped by A")
  		--StandardDebug("Stopped by A")
			if  tonumber(fibaro:getValue(639, "armed")) > 0 
        	then
      		SimulatorPresenceEngine:TurnOff(ID_devices_lights)
        	end
    end

    -- Condition to start simulation
if ((fibaro:getGlobal("Simu_presence") == "On") and os.time() <= endtime and fibaro:getGlobal("SunSet") == "Ja" and (os.date("%H:%M", os.time()) >= fibaro:getValue(1,'sunriseHour'))) then
      	--StandardDebug("Lights simulation is activated. Normally starting at "..sunsetHour .. " and stopping at: "..stop_hour..":"..stop_minute );
  		--pushMessage("Lights simulation is activated. Normally starting at "..sunsetHour .. " and stopping at: "..stop_hour..":"..stop_minute );
  		-- Giving a head start with three lights
  		fibaro:call(289, "turnOn"); -- spot kjøkken
  		fibaro:call(51, "turnOn"); -- Spot lang gang
  		fibaro:call(63, "turnOn"); -- Spot trapp
   		fibaro:call(67, "turnOn"); -- Spot tv
  		--StandardDebug("Turned on " .. fibaro:getName(289) .. " , " .. fibaro:getName(51) .. " and " .. fibaro:getName(63))
    	--pushMessage("Turned on " .. fibaro:getName(289) .. " , " .. fibaro:getName(51) .. " and " .. fibaro:getName(63))
  		SimulatorPresenceEngine:Launch(); --launch the simulation when virtual device is on, and the current time is triggered.
end

