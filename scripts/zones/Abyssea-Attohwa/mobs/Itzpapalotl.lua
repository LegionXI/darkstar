-----------------------------------
--  Area: Abyssea - Attohwa (215)
--   Mob: Itzpapalotl
-----------------------------------

-- require("scripts/zones/Abyssea-Attohwa/MobIDs");

package.loaded["scripts/globals/abyssea"] = nil;
require("scripts/zones/Abyssea-Attohwa/MobIDs");
require("scripts/zones/Abyssea-Attohwa/textIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,10);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_MEVA,20);
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_DOUBLE_ATTACK,15);	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)	
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;
