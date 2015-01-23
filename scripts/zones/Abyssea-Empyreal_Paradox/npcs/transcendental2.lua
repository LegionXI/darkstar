-----------------------------------
-- Area: Abyssea Empyreal Paradox
-- NPC: Transcendental Radiance
-- @zone 255
-----------------------------------
package.loaded["scripts/zones/Abyssea-Empyreal_Paradox/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Abyssea-Empyreal_Paradox/TextIDs");

-----------------------------------
-- onEventUpdate
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x7d03);
	return 1;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	printf("onUpdate CSID: %u",csid);
	printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	printf("onFinish CSID: %u",csid);
	printf("onFinish RESULT: %u",option);

	local pZone = player:getZoneID();

	if(csid == 0x7d03 and option == 4) then
		if(player:getVar(tostring(pZone) .. "_Fight") == 100) then
			player:setVar("BCNM_Killed",0);
			player:setVar("BCNM_Timer",0);
		end
		player:setVar(tostring(pZone) .. "_Runaway",1);
		player:delStatusEffect(EFFECT_BATTLEFIELD);
		player:setVar(tostring(pZone) .. "_Runaway",0)
	end

end;