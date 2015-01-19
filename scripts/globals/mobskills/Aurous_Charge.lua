---------------------------------------------------
--  Deathgnash
--
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  ,Bind (30 sec)
--  Type: Magical
--  

---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
end;

function onMobWeaponSkill(target, mob, skill)

    local targetcurrentHP = target:getHP();
    local targetmaxHP = target:getMaxHP(); 
    local hpset=targetmaxHP*0.50;
   	local typeEffect = EFFECT_BIND;
   	MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30);
	
      if(HP > 1)then     
        dmg= hpset;
      else
        dmg=0;
	  end
	  
	target:delHP(dmg);
    return dmg;
end
