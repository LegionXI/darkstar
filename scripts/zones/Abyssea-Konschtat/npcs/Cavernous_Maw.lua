-----------------------------------
-- Area: Abyssea Konschatat
-- Name: Cavernous Maw
-- Teleports Players to Konschatat
-- Highlands
-- @zone 15
-- @pos 159.943, -72.109, -839.986
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/campaign");
require("scripts/globals/status");
require("scripts/zones/Abyssea-Konschtat/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x00c8);	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if(csid == 0x00c8 and option == 1) then
	    player:delStatusEffect(EFFECT_VISITANT);
		player:delStatusEffect(EFFECT_REGEN);
		player:delStatusEffect(EFFECT_REGAIN);
		player:delStatusEffect(EFFECT_REFRESH);
		player:delStatusEffect(EFFECT_MAX_HP_BOOST);
		player:setPos(91,-68,-582,107,108); 
	end
end;