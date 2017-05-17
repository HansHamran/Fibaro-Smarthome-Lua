--[[
%% autostart
%% properties
32 value
%% events
%% globals
VarmtKjolerom
--]]

local startSource = fibaro:getSourceTrigger();
if (
 ( tonumber(fibaro:getValue(32, "value")) > 11  and  fibaro:getGlobalValue("VarmtKjolerom") == "Nei" )
or
startSource["type"] == "other"
)
then
    local melding = ("Kjølerommet er " .. fibaro:getValue(32, "value") .. " grader")
	fibaro:call(448,'sendPush', melding);
    fibaro:setGlobal("VarmtKjolerom", "Ja")
end

