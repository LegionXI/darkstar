---------------------------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

	local typeEffect = EFFECT_ATTACK_DOWN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 75, 0, 30);
    MobStatusEffectMove(mob, target, EFFECT_TERROR, 1, 0, 60);
	target:delHP(dmg);
	return dmg;
end;