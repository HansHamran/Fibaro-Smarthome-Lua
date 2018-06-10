--[[
%% autostart
%% properties
30 value
572 value
%% events
%% globals
--]]

local startSource = fibaro:getSourceTrigger();
if (
 (( tonumber(fibaro:getValue(30, "value")) > 24 )
and
 ( tonumber(fibaro:getValue(572, "value")) > 0 )
and 	fibaro:getGlobal("Varmstue") == "false")
or
startSource["type"] == "other"
)
then
  	local melding = ("Stua er " .. fibaro:getValue(30, "value") .. " grader. Likevel står ovnene på.")
	fibaro:call(710,'sendPush', melding);
    fibaro:call(2, "sendEmail", "Advarsel Stua er varm", melding); -- Mail Hans Olav
end


