ConROC.Warrior = {};

local ConROC_Warrior, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = 'Warrior';
	self.NextSpell = ConROC.Warrior.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
	
--	ConROC:WarriorFrame1();
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warrior.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

	local Racial, Spec, Stance, Arms_Ability, Arms_Talent, Fury_Ability, Fury_Talent, Prot_Ability, Prot_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Stance, ids.Arms_Ability, ids.Arms_Talent, ids.Fury_Ability, ids.Fury_Talent, ids.Prot_Ability, ids.Prot_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;

	local _Charge = Arms_Ability.ChargeRank1;
	local _Hamstring = Arms_Ability.HamstringRank1;
	local _HeroicStrike = Arms_Ability.HeroicStrikeRank1;
	local _MockingBlow = Arms_Ability.MockingBlowRank1;
	local _MortalStrike = Arms_Ability.MortalStrikeRank1;
	local _Overpower = Arms_Ability.OverpowerRank1;
	local _Rend = Arms_Ability.RendRank1;
	local _ThunderClap = Arms_Ability.ThunderClapRank1;
	
	local _BattleShout = Fury_Ability.BattleShoutRank1;
	local _Bloodthirst = Fury_Ability.BloodthirstRank1;
	local _Cleave = Fury_Ability.CleaveRank1;
	local _DemoralizingShout = Fury_Ability.DemoralizingShoutRank1;
	local _Execute = Fury_Ability.ExecuteRank1;
	local _Intercept = Fury_Ability.InterceptRank1;
	local _Pummel = Fury_Ability.PummelRank1;
	local _Slam = Fury_Ability.SlamRank1;
	
	local _Revenge = Prot_Ability.RevengeRank1;
	local _ShieldBash = Prot_Ability.ShieldBashRank1;
	local _ShieldSlam = Prot_Ability.ShieldSlamRank1;
	local _SunderArmor = Prot_Ability.SunderArmorRank1;

function ConROC.Warrior.Damage(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Ranks
	if IsSpellKnown(Arms_Ability.ChargeRank3) then _Charge = Arms_Ability.ChargeRank3;
	elseif IsSpellKnown(Arms_Ability.ChargeRank2) then _Charge = Arms_Ability.ChargeRank2; end
	
	if IsSpellKnown(Arms_Ability.HamstringRank3) then _Hamstring = Arms_Ability.HamstringRank3;
	elseif IsSpellKnown(Arms_Ability.HamstringRank2) then _Hamstring = Arms_Ability.HamstringRank2; end	
	
	if IsSpellKnown(Arms_Ability.HeroicStrikeRank8) then _HeroicStrike = Arms_Ability.HeroicStrikeRank8;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank7) then _HeroicStrike = Arms_Ability.HeroicStrikeRank7;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank6) then _HeroicStrike = Arms_Ability.HeroicStrikeRank6;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank5) then _HeroicStrike = Arms_Ability.HeroicStrikeRank5;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank4) then _HeroicStrike = Arms_Ability.HeroicStrikeRank4;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank3) then _HeroicStrike = Arms_Ability.HeroicStrikeRank3;
	elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank2) then _HeroicStrike = Arms_Ability.HeroicStrikeRank2; end
	
	if IsSpellKnown(Arms_Ability.MockingBlowRank5) then _MockingBlow = Arms_Ability.MockingBlowRank5;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank4) then _MockingBlow = Arms_Ability.MockingBlowRank4;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank3) then _MockingBlow = Arms_Ability.MockingBlowRank3;
	elseif IsSpellKnown(Arms_Ability.MockingBlowRank2) then _MockingBlow = Arms_Ability.MockingBlowRank2; end
	
	if IsSpellKnown(Arms_Ability.MortalStrikeRank4) then _MortalStrike = Arms_Ability.MortalStrikeRank4;
	elseif IsSpellKnown(Arms_Ability.MortalStrikeRank3) then _MortalStrike = Arms_Ability.MortalStrikeRank3;
	elseif IsSpellKnown(Arms_Ability.MortalStrikeRank2) then _MortalStrike = Arms_Ability.MortalStrikeRank2; end

	if IsSpellKnown(Arms_Ability.OverpowerRank4) then _Overpower = Arms_Ability.OverpowerRank4;
	elseif IsSpellKnown(Arms_Ability.OverpowerRank3) then _Overpower = Arms_Ability.OverpowerRank3;
	elseif IsSpellKnown(Arms_Ability.OverpowerRank2) then _Overpower = Arms_Ability.OverpowerRank2; end
	
	if IsSpellKnown(Arms_Ability.RendRank7) then _Rend = Arms_Ability.RendRank7;
	elseif IsSpellKnown(Arms_Ability.RendRank6) then _Rend = Arms_Ability.RendRank6;
	elseif IsSpellKnown(Arms_Ability.RendRank5) then _Rend = Arms_Ability.RendRank5;
	elseif IsSpellKnown(Arms_Ability.RendRank4) then _Rend = Arms_Ability.RendRank4;
	elseif IsSpellKnown(Arms_Ability.RendRank3) then _Rend = Arms_Ability.RendRank3;
	elseif IsSpellKnown(Arms_Ability.RendRank2) then _Rend = Arms_Ability.RendRank2; end
	
	if IsSpellKnown(Arms_Ability.ThunderClapRank6) then _ThunderClap = Arms_Ability.ThunderClapRank6;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank5) then _ThunderClap = Arms_Ability.ThunderClapRank5;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank4) then _ThunderClap = Arms_Ability.ThunderClapRank4;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank3) then _ThunderClap = Arms_Ability.ThunderClapRank3;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank2) then _ThunderClap = Arms_Ability.ThunderClapRank2; end
	
	if IsSpellKnown(Fury_Ability.BattleShoutRank6) then _BattleShout = Fury_Ability.BattleShoutRank6;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank5) then _BattleShout = Fury_Ability.BattleShoutRank5;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank4) then _BattleShout = Fury_Ability.BattleShoutRank4;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank3) then _BattleShout = Fury_Ability.BattleShoutRank3;
	elseif IsSpellKnown(Fury_Ability.BattleShoutRank2) then _BattleShout = Fury_Ability.BattleShoutRank2; end	
	
	if IsSpellKnown(Fury_Ability.BloodthirstRank4) then _Bloodthirst = Fury_Ability.BloodthirstRank4;
	elseif IsSpellKnown(Fury_Ability.BloodthirstRank3) then _Bloodthirst = Fury_Ability.BloodthirstRank3;
	elseif IsSpellKnown(Fury_Ability.BloodthirstRank2) then _Bloodthirst = Fury_Ability.BloodthirstRank2; end	
	
	if IsSpellKnown(Fury_Ability.CleaveRank5) then _Cleave = Fury_Ability.CleaveRank5;
	elseif IsSpellKnown(Fury_Ability.CleaveRank4) then _Cleave = Fury_Ability.CleaveRank4;
	elseif IsSpellKnown(Fury_Ability.CleaveRank3) then _Cleave = Fury_Ability.CleaveRank3;
	elseif IsSpellKnown(Fury_Ability.CleaveRank2) then _Cleave = Fury_Ability.CleaveRank2; end
	
	if IsSpellKnown(Fury_Ability.DemoralizingShoutRank5) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank5;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank4) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank4;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank3) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank3;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank2) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank2; end	
	
	if IsSpellKnown(Fury_Ability.ExecuteRank5) then _Execute = Fury_Ability.ExecuteRank5;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank4) then _Execute = Fury_Ability.ExecuteRank4;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank3) then _Execute = Fury_Ability.ExecuteRank3;
	elseif IsSpellKnown(Fury_Ability.ExecuteRank2) then _Execute = Fury_Ability.ExecuteRank2; end
	
	if IsSpellKnown(Fury_Ability.InterceptRank3) then _Intercept = Fury_Ability.InterceptRank3;
	elseif IsSpellKnown(Fury_Ability.InterceptRank2) then _Intercept = Fury_Ability.InterceptRank2; end

	if IsSpellKnown(Fury_Ability.PummelRank2) then _Pummel = Fury_Ability.PummelRank2; end

	if IsSpellKnown(Fury_Ability.SlamRank4) then _Slam = Fury_Ability.SlamRank4;
	elseif IsSpellKnown(Fury_Ability.SlamRank3) then _Slam = Fury_Ability.SlamRank3;
	elseif IsSpellKnown(Fury_Ability.SlamRank2) then _Slam = Fury_Ability.SlamRank2; end
	
	if IsSpellKnown(Prot_Ability.RevengeRank5) then _Revenge = Prot_Ability.RevengeRank5;
	elseif IsSpellKnown(Prot_Ability.RevengeRank4) then _Revenge = Prot_Ability.RevengeRank4;
	elseif IsSpellKnown(Prot_Ability.RevengeRank3) then _Revenge = Prot_Ability.RevengeRank3;
	elseif IsSpellKnown(Prot_Ability.RevengeRank2) then _Revenge = Prot_Ability.RevengeRank2; end
	
	if IsSpellKnown(Prot_Ability.ShieldBashRank3) then _ShieldBash = Prot_Ability.ShieldBashRank3;
	elseif IsSpellKnown(Prot_Ability.ShieldBashRank2) then _ShieldBash = Prot_Ability.ShieldBashRank2; end
	
	if IsSpellKnown(Prot_Ability.ShieldSlamRank4) then _ShieldSlam = Prot_Ability.ShieldSlamRank4;
	elseif IsSpellKnown(Prot_Ability.ShieldSlamRank3) then _ShieldSlam = Prot_Ability.ShieldSlamRank3;
	elseif IsSpellKnown(Prot_Ability.ShieldSlamRank2) then _ShieldSlam = Prot_Ability.ShieldSlamRank2; end
	
	if IsSpellKnown(Prot_Ability.SunderArmorRank5) then _SunderArmor = Prot_Ability.SunderArmorRank5;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank4) then _SunderArmor = Prot_Ability.SunderArmorRank4;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank3) then _SunderArmor = Prot_Ability.SunderArmorRank3;
	elseif IsSpellKnown(Prot_Ability.SunderArmorRank2) then _SunderArmor = Prot_Ability.SunderArmorRank2; end
	
--Abilities
	local batStanceRDY 										= ConROC:AbilityReady(Arms_Ability.BattleStance, timeShift);
	--local berStanceRDY 										= ConROC:AbilityReady(0, timeShift);
	--local defStanceRDY 										= ConROC:AbilityReady(0, timeShift);

	local chargeRDY		 									= ConROC:AbilityReady(_Charge, timeShift);
	local batShoutRDY		 								= ConROC:AbilityReady(_BattleShout, timeShift);	
		local batShoutBUFF		 								= ConROC:Buff(_BattleShout, timeShift);		
	local hStrikeRDY		 								= ConROC:AbilityReady(_HeroicStrike, timeShift);
	local rendRDY											= ConROC:AbilityReady(_Rend, timeShift);
		local rendDEBUFF		 								= ConROC:TargetDebuff(_Rend, timeShift);
	local tclapRDY											= ConROC:AbilityReady(_ThunderClap, timeShift);	
	local exeRDY											= ConROC:AbilityReady(_Execute, timeShift);
	local oPowerRDY											= ConROC:AbilityReady(_Overpower, timeShift);
		
--Conditions
	local inStance											= GetShapeshiftForm();
	local incombat 											= UnitAffectingCombat('player');	
	local targetPh 											= ConROC:PercentHealth('target');
	local canExe											= targetPh <= 25;
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= 0;
	
	if IsSpellKnown(_Rend) then
		tarInMelee = ConROC:Targets(_Rend);
	else
		tarInMelee = 0;
	end
	
--Indicators		

--Warnings	
	
--Rotations	
	if batShoutRDY and not batShoutBUFF then
		return _BattleShout;
	end

	if chargeRDY and not incombat and inStance == Stance.Battle then
		return _Charge;
	end
	
	if exeRDY and targetPh <= 20 and inStance == (Stance.Battle or Stance.Berserker) then
		return _Execute;
	end
	
	if oPowerRDY and inStance == Stance.Battle then
		return _Overpower;
	end
	
--[[if tclapRDY and tarInMelee >= 2 and inStance == Stance.Battle then
		return _ThunderClap;
	end]]
	
	if rendRDY and not rendDEBUFF and inStance == (Stance.Battle or Stance.Defensive) then
		return _Rend;
	end

	ConROC:AbilityTaunt(_HeroicStrike, hStrikeRDY); --Felt looks better then Burst.
	return nil;
end

function ConROC.Warrior.Defense(_, timeShift, currentSpell, gcd, tChosen)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Abilities	

--Conditions	
	local playerPh 											= ConROC:PercentHealth('player');

--Rotations	

	return nil;
end