-----------------------------------
-- Area: Yuhtunga Jungle
-- NPC:  Darrcuiln
-----------------------------------
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
	mob:addMod(MOD_ACC,150);
	mob:addMod(MOD_TRIPLE_ATTACK,10)
    mob:setMod(MOD_REGEN, 30);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	mob:setMod(MOD_REGAIN,15);
end;
-----------------------------------

-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
mob:setLocalVar("BattleStart", os.time())
end;
-----------------------------------
-- onMobFight Action
-----------------------------------


function onMobFight(mob, target)
    local Darrcuiln_2hr_Used = 0;
    if (mob:getLocalVar("Darrcuiln_2hr") ~= nil) then
        Darrcuiln_2hr_Used = mob:getLocalVar("Darrcuiln_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Darrcuiln_2hr_Used == 2) then
            mob:useMobAbility(437); -- PD
            mob:setLocalVar("Darrcuiln_2hr", 3);
        end
    elseif (mob:getHPP() <= 30) then 
        if (Darrcuiln_2hr_Used == 1) then
            mob:useMobAbility(437); -- PD
            mob:setLocalVar("Darrcuiln_2hr", 2);
        end
    elseif (mob:getHPP() <= 70) then 
        if (Darrcuiln_2hr_Used == 0) then
            mob:useMobAbility(437); -- PD
            mob:setLocalVar("Darrcuiln_2hr", 1);
        end
    elseif (Darrcuiln_2hr_Used == 3) then
            mob:addStatusEffect(EFFECT_HASTE,200,0,200);	
		end	
	elseif (os.time() -BattleStart > 3600) then
			mob:setMod(MOD_MDEF,3000);
			mob:setMod(MOD_DEF,3000);	
			mob:setMod(MOD_MATT,3000);
			mob:setMod(MOD_ATT,3000);
			mob:setMod(MOD_STR,3000);
			mob:setMod(MOD_VIT,3000);
			mob:setMod(MOD_INT,3000);
			mob:setMod(MOD_AGI,3000);
			mob:setMod(MOD_TRIPLE_ATTACK,3000);	
		end		
    end
end;	
-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

end;