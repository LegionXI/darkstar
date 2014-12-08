---------------------------------------------
--  Oblivion Smash
--
--  Description: Deals damage to players within area of effect and inflicts blind, silence, bind, and weight.
--  Type: Physical
--  Utsusemi/Blink absorb:  2-3 shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	
	local numhits = 3;
	local accmod = 1;
	local dmgmod = 2;
	
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

	target:delHP(dmg);
	return dmg;
	
end;