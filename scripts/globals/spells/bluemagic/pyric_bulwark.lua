-----------------------------------
-- Spell: Pyric Bulwark
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------
-- onSpellcast
-----------------------------------

function OnMagicCastingCheck(caster,target,spell)
	if (caster:hasStatusEffect(EFFECT_UNBRIDLED_LEARNING) == true) then
      return 0;
   else
      return MSGBASIC_STATUS_PREVENTS;
   end
end;

function onSpellCast(caster, target, spell)

	local power = 500; -- Percentage, not amount.
    
    local duration = 300;

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
	if(target:addStatusEffect(EFFECT_DEFENSE_BOOST,power,0,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end

    return EFFECT_DEFENSE_BOOST;
end;