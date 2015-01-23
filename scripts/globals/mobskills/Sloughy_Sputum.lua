---------------------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	MobStatusEffectMove(mob, target, EFFECT_DROWN, (mob:getMainLvl()/10), 3, 60);
	MobStatusEffectMove(mob, target, EFFECT_WEAKNESS, 1, 0, 60);
	MobStatusEffectMove(mob, target, EFFECT_AMNESIA, 15, 0, 60);
	MobStatusEffectMove(mob, target, EFFECT_WEIGHT, 50, 0, 60);

	local dmgmod = MobBreathMove(mob, target, 0.15, 3, ELE_EARTH, 1200);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_EARTH,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
end;