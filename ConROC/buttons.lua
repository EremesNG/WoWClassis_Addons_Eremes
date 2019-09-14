ConROC.Spells = {};
ConROC.Keybinds = {};
ConROC.DefSpells = {};
ConROC.Flags = {};
ConROC.SpellsGlowing = {};
ConROC.WindowsGlowing = {};
ConROC.DefGlowing = {};
ConROC.DefWindowsGlowing = {};
ConROC.DamageFramePool = {};
ConROC.DamageFrames = {};
ConROC.DefenseFramePool = {};
ConROC.DefenseFrames = {};
ConROC.InterruptFramePool = {};
ConROC.InterruptFrames = {};
ConROC.CoolDownFramePool = {};
ConROC.CoolDownFrames = {};
ConROC.PurgableFramePool = {};
ConROC.PurgableFrames = {};
ConROC.RaidBuffsFramePool = {};
ConROC.RaidBuffsFrames = {};
ConROC.MovementFramePool = {};
ConROC.MovementFrames = {};
ConROC.TauntFramePool = {};
ConROC.TauntFrames = {};
ConROC.WindowFramePool = {};
ConROC.WindowFrames = {};
ConROC.DefWindowFramePool = {};
ConROC.DefWindowFrames = {};

function TTOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Target Toggle")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine('MACRO = "/ConROCToggle"', 1, 1, 1, true)
	GameTooltip:AddLine(" ", 1, 1, 1, true)
	GameTooltip:AddLine("Single", .2, 1, .2)
		GameTooltip:AddLine("This is for single target fights.", 1, 1, 1, true)
	GameTooltip:AddLine("AoE", 1, .2, .2)
		GameTooltip:AddLine("Can be used for trash or Boss fights with frequent adds.", 1, 1, 1, true)
	GameTooltip:AddLine(" ", 1, 1, 1, true)
		GameTooltip:AddLine('"This can be toggled during combat as phases change."', 1, 1, 0, true)
	GameTooltip:Show()
end

function TTOnLeave(self)
	GameTooltip:Hide()
end

function ETOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Rotation Toggle")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine('MACRO = "/ConROCBurstToggle"', 1, 1, 1, true)
	GameTooltip:AddLine(" ", 1, 1, 1, true)
	GameTooltip:AddLine("Burst Rotation", .2, 1, .2)
		GameTooltip:AddLine("This is for Boss fights where you want to decide when to use your cooldowns.", 1, 1, 1, true)
	GameTooltip:AddLine("Full Rotation", 1, .2, .2)
		GameTooltip:AddLine("Can be used for placing long cooldowns into the recommended rotation.", 1, 1, 1, true)
	GameTooltip:AddLine(" ", 1, 1, 1, true)
		GameTooltip:AddLine('"This can be toggled during combat as phases change."', 1, 1, 0, true)
	GameTooltip:Show()
end

function ETOnLeave(self)
	GameTooltip:Hide()
end

function TWOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Window")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine("", .2, 1, .2)
		GameTooltip:AddLine("This window displays the next suggested ability in your rotation.", 1, 1, 1, true)
	GameTooltip:Show()
end

function TWOnLeave(self)
	GameTooltip:Hide()
end

function TDWOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Defense Window")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine("", .2, 1, .2)
		GameTooltip:AddLine("This window displays the next suggested defense ability in your rotation.", 1, 1, 1, true)
	GameTooltip:Show()
end

function TDWOnLeave(self)
	GameTooltip:Hide()
end

function TIWOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Interrupt Flash")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine("", .2, 1, .2)
		GameTooltip:AddLine("This flash displays that you can interrupt.", 1, 1, 1, true)
	GameTooltip:Show()
	
	local color = ConROC.db.profile.interruptOverlayColor;
	ConROCInterruptWindow:SetSize(ConROC.db.profile.flashIconSize * .75, ConROC.db.profile.flashIconSize * .75);
	ConROCInterruptWindow.texture:SetVertexColor(color.r, color.g, color.b);	
end

function TIWOnLeave(self)
	GameTooltip:Hide()
	
	ConROCInterruptWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
	ConROCInterruptWindow.texture:SetVertexColor(.1, .1, .1);		
end

function TPWOnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText("ConROC Purge Flash")  -- This sets the top line of text, in gold.
	GameTooltip:AddLine("", .2, 1, .2)
		GameTooltip:AddLine("This flash displays that you can purge.", 1, 1, 1, true)
	GameTooltip:Show()
	
	local color = ConROC.db.profile.purgeOverlayColor;
	ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .75, ConROC.db.profile.flashIconSize * .75);
	ConROCPurgeWindow.texture:SetVertexColor(color.r, color.g, color.b);		
end

function TPWOnLeave(self)
	GameTooltip:Hide()
	
	ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
	ConROCPurgeWindow.texture:SetVertexColor(.1, .1, .1);	
end

function ConROC:DisplayToggleFrame()
	local _, Class = UnitClass("player")
	local Color = RAID_CLASS_COLORS[Class]
	local frame = CreateFrame("Frame", "ConROCButtonFrame", UIParent)
		frame:SetFrameStrata('LOW');
		frame:SetSize((50) + 14, (15) + 14)
		frame:SetScale(ConROC.db.profile.toggleButtonSize)
		frame:SetAlpha(1)
		
		frame:SetBackdrop( { 
			bgFile = "Interface\\CHATFRAME\\CHATFRAMEBACKGROUND", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true,
			tileSize = 8,
			edgeSize = 20, 
			insets = { left = 4, right = 4, top = 4, bottom = 4 }
			})
		frame:SetBackdropColor(0, 0, 0, .75)
		frame:SetBackdropBorderColor(Color.r, Color.g, Color.b, .75)
		
		frame:SetPoint("CENTER", 180, -20)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", function(self)
			if ConROC.db.profile.unlockWindow then
				frame:StartMoving()
			end
		end)
		frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
		frame:Show()
end

function ConROC:CreateDamageButton()
	local tbutton = CreateFrame("Button", 'ConROC_DamageButton', UIParent)
		tbutton:SetFrameStrata('MEDIUM')
		tbutton:SetFrameLevel('6')
		tbutton:SetPoint("BOTTOMRIGHT", "ConROCButtonFrame", "BOTTOMRIGHT", -7, 7)
		tbutton:SetSize(50, 15)
		tbutton:SetScale(ConROC.db.profile.toggleButtonSize)
		tbutton:Show()
		tbutton:SetAlpha(1)
		
		tbutton:SetText("Damage")
		tbutton:SetNormalFontObject("GameFontHighlightSmall")
		
		tbutton:SetScript("OnEnter", TTOnEnter)
		tbutton:SetScript("OnLeave", TTOnLeave)
		
	local ntex = tbutton:CreateTexture()
		ntex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonUp")
		ntex:SetTexCoord(0, 0.625, 0, 0.6875)
		ntex:SetVertexColor(.90, .40, .40, 1)
		ntex:SetAllPoints()	
		tbutton:SetNormalTexture(ntex)

	local htex = tbutton:CreateTexture()
		htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
		htex:SetTexCoord(0, 0.625, 0, 0.6875)
		htex:SetAllPoints()
		tbutton:SetHighlightTexture(htex)

	local ptex = tbutton:CreateTexture()
		ptex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonDown")
		ptex:SetTexCoord(0, 0.625, 0, 0.6875)
		ptex:SetVertexColor(.90, .40, .40, 1)
		ptex:SetAllPoints()
		tbutton:SetPushedTexture(ptex)
		
		tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
			local _, _, Class = UnitClass("player")
			if Class == 2 or Class == 7 or Class == 11 then
				self:Hide();
				ConROC_TankButton:Show();
				ConROC_HealsButton:Hide();
			elseif Class == 1 then
				self:Hide();
				ConROC_TankButton:Show();
			elseif Class == 5 then
				self:Hide();
				ConROC_HealsButton:Show();
			end
		end)
end

function ConROC:CreateTankButton()
	local tbutton = CreateFrame("Button", 'ConROC_TankButton', UIParent)
		tbutton:SetFrameStrata('MEDIUM');
		tbutton:SetFrameLevel('6')
		tbutton:SetPoint("BOTTOMRIGHT", "ConROCButtonFrame", "BOTTOMRIGHT", -7, 7)
		tbutton:SetScale(ConROC.db.profile.toggleButtonSize)
		tbutton:SetSize(50, 15)
		tbutton:Hide()
		tbutton:SetAlpha(1)
		
		tbutton:SetText("Tank")
		tbutton:SetNormalFontObject("GameFontHighlightSmall")
		
		tbutton:SetScript("OnEnter", TTOnEnter)
		tbutton:SetScript("OnLeave", TTOnLeave)

	local ntex = tbutton:CreateTexture()
		ntex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonUp")
		ntex:SetTexCoord(0, 0.625, 0, 0.6875)
		ntex:SetVertexColor(.45, .65, .85, 1)
		ntex:SetAllPoints()	
		tbutton:SetNormalTexture(ntex)

	local htex = tbutton:CreateTexture()
		htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
		htex:SetTexCoord(0, 0.625, 0, 0.6875)
		htex:SetAllPoints()
		tbutton:SetHighlightTexture(htex)

	local ptex = tbutton:CreateTexture()
		ptex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonDown")
		ptex:SetTexCoord(0, 0.625, 0, 0.6875)
		ptex:SetVertexColor(.45, .65, .85, 1)
		ptex:SetAllPoints()
		tbutton:SetPushedTexture(ptex)
		
		tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
			local _, _, Class = UnitClass("player")
			if Class == 2 or Class == 7 or Class == 11 then
					ConROC_DamageButton:Hide();
					self:Hide();
					ConROC_HealsButton:Show();
			elseif Class == 1 then
					ConROC_DamageButton:Show();			
					self:Hide();
			end
		end)
end

function ConROC:CreateHealsButton()
	local tbutton = CreateFrame("Button", 'ConROC_HealsButton', UIParent)
		tbutton:SetFrameStrata('MEDIUM');
		tbutton:SetFrameLevel('6')
		tbutton:SetPoint("BOTTOMRIGHT", "ConROCButtonFrame", "BOTTOMRIGHT", -7, 7)
		tbutton:SetScale(ConROC.db.profile.toggleButtonSize)
		tbutton:SetSize(50, 15)
		tbutton:Hide()
		tbutton:SetAlpha(1)
		
		tbutton:SetText("Heals")
		tbutton:SetNormalFontObject("GameFontHighlightSmall")
		
		tbutton:SetScript("OnEnter", TTOnEnter)
		tbutton:SetScript("OnLeave", TTOnLeave)

	local ntex = tbutton:CreateTexture()
		ntex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonUp")
		ntex:SetTexCoord(0, 0.625, 0, 0.6875)
		ntex:SetVertexColor(.60, .75, .50, 1)
		ntex:SetAllPoints()	
		tbutton:SetNormalTexture(ntex)

	local htex = tbutton:CreateTexture()
		htex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonHighlight")
		htex:SetTexCoord(0, 0.625, 0, 0.6875)
		htex:SetAllPoints()
		tbutton:SetHighlightTexture(htex)

	local ptex = tbutton:CreateTexture()
		ptex:SetTexture("Interface\\AddOns\\ConROC\\images\\buttonDown")
		ptex:SetTexCoord(0, 0.625, 0, 0.6875)
		ptex:SetVertexColor(.60, .75, .50, 1)
		ptex:SetAllPoints()
		tbutton:SetPushedTexture(ptex)
		
		tbutton:SetScript("OnMouseUp", function (self, tbutton, up)
		local _, _, Class = UnitClass("player")
			if Class == 2 or Class == 7 or Class == 11 then
					ConROC_DamageButton:Show();
					ConROC_TankButton:Hide();
					self:Hide();
			elseif Class == 5 then
					ConROC_DamageButton:Show();
					self:Hide();
			end
		end)
end

function ConROC:SlashUnlock()
	if not ConROC.db.profile.unlockWindow then
		ConROC.db.profile.unlockWindow = true;
	else
		ConROC.db.profile.unlockWindow = false;
	end
	
	ConROCWindow:EnableMouse(ConROC.db.profile.unlockWindow);
	ConROCDefenseWindow:EnableMouse(ConROC.db.profile.unlockWindow);
	ConROCInterruptWindow:EnableMouse(ConROC.db.profile.unlockWindow);
	ConROCPurgeWindow:EnableMouse(ConROC.db.profile.unlockWindow);
	ConROCDefenseWindow:SetMovable(ConROC.db.profile.unlockWindow);
	ConROCInterruptWindow:SetMovable(ConROC.db.profile.unlockWindow);
	ConROCPurgeWindow:SetMovable(ConROC.db.profile.unlockWindow);
	if ConROC.db.profile.unlockWindow and ConROC.db.profile.enableInterruptWindow == true then
		ConROCInterruptWindow:Show();				
	else
		ConROCInterruptWindow:Hide();				
	end	
	if ConROC.db.profile.unlockWindow and ConROC.db.profile.enablePurgeWindow == true then
		ConROCPurgeWindow:Show();					
	else
		ConROCPurgeWindow:Hide();					
	end		
end

function ConROC:SlashToggle()
		local _, _, Class = UnitClass("player")
		if Class == 2 or Class == 7 or Class == 11 then
			if ConROC_DamageButton:IsVisible() then
				ConROC_DamageButton:Hide();
				ConROC_TankButton:Show();
				ConROC_HealsButton:Hide();
			elseif ConROC_TankButton:IsVisible() then
				ConROC_Damageutton:Hide();
				ConROC_TankButton:Hide();
				ConROC_HealsButton:Show();
			elseif ConROC_HealsButton:IsVisible() then
				ConROC_DamageButton:Show();
				ConROC_TankButton:Hide();
				ConROC_HealsButton:Hide();
			end
		elseif Class == 1 then
			if ConROC_DamageButton:IsVisible() then
				ConROC_DamageButton:Hide();
				ConROC_TankButton:Show();
			elseif ConROC_TankButton:IsVisible() then
				ConROC_DamageButton:Show();
				ConROC_TankButton:Hide();
			end	
		elseif Class == 5 then
			if ConROC_DamageButton:IsVisible() then
				ConROC_DamageButton:Hide();
				ConROC_HealsButton:Show();
			elseif ConROC_HealsButton:IsVisible() then
				ConROC_DamageButton:Show();
				ConROC_HealsButton:Hide();	
			end
		end
end

SLASH_CONROCUNLOCK1 = '/ConROCUL'
SLASH_CONROC1 = '/ConROCtoggle'
SlashCmdList["CONROCUNLOCK"] = function() ConROC:SlashUnlock() end
SlashCmdList["CONROC"] = function() ConROC:SlashToggle() end -- Slash Command List
	
function ConROC:DisplayWindowFrame()
	local frame = CreateFrame("Frame", "ConROCWindow", UIParent)
	local _, _, spellTexture = GetSpellInfo(20585);
		frame:SetMovable(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnEnter", TWOnEnter)
		frame:SetScript("OnLeave", TWOnLeave)
		frame:SetScript("OnDragStart", function(self)
			if ConROC.db.profile.unlockWindow then
				frame:StartMoving()
			end
		end)
		frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
		frame:EnableMouse(ConROC.db.profile.unlockWindow)
		
		frame:SetPoint("CENTER", -200, 50)
		frame:SetSize(ConROC.db.profile.windowIconSize, ConROC.db.profile.windowIconSize)
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('4');
		if ConROC.db.profile.combatWindow or ConROC:HealSpec() then
			frame:Hide();
		elseif not ConROC.db.profile.enableWindow then
			frame:Hide();
		else
			frame:Show();
		end
	local t = frame.texture;
		if not t then
			t = frame:CreateTexture("ARTWORK")
			t:SetTexture(spellTexture);
			t:SetBlendMode('BLEND');
			t:SetAlpha(ConROC.db.profile.transparencyWindow);
			frame.texture = t;
		end
		
		t:SetAllPoints(frame)

	local cd = CreateFrame("Cooldown", "ConROCWindowCooldown", frame, "CooldownFrameTemplate")
		cd:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
		cd:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE")
		cd:RegisterEvent("UNIT_SPELLCAST_DELAYED")
		cd:RegisterEvent("UNIT_SPELLCAST_SENT")
		cd:RegisterEvent("UNIT_SPELLCAST_START")
		cd:SetAllPoints(frame)
		cd:SetFrameStrata('MEDIUM');
		cd:SetFrameLevel('7');			
		if ConROC.db.profile.enableWindowCooldown then
			cd:SetScript("OnEvent",function(self)
				local gcdStart, gcdDuration = GetSpellCooldown(61304)
				local _, _, _, startTimeMS, endTimeMS = CastingInfo();
				local _, _, _, startTimeMSchan, endTimeMSchan = ChannelInfo();
				if not (endTimeMS or endTimeMSchan) then
					cd:SetCooldown(gcdStart, gcdDuration)
				elseif endTimeMSchan then
					local chanStart  = startTimeMSchan / 1000;
					local chanDuration = endTimeMSchan/1000 - GetTime();
					cd:SetCooldown(chanStart, chanDuration)
				else
					local spStart  = startTimeMS / 1000;
					local spDuration = endTimeMS/1000 - GetTime();
					cd:SetCooldown(spStart, spDuration)			
				end
			end)
		end
end

function ConROC:CreateDisplayWindow(parent, id)
	local frame = tremove(self.WindowFramePool);
	local spellName, _, spellTexture = GetSpellInfo(id);
	local _, Class = UnitClass("player");
	local Color = RAID_CLASS_COLORS[Class];
		if not frame then
			frame = CreateFrame('Frame', 'ConROC_WindowSpell_' .. id, parent);
			fontstring = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			fontkey = frame:CreateFontString("ConROC_HotKey_" .. id, "ARTWORK", "GameFontHighlight");
		end

	frame:SetParent("ConROCWindow");
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6');
	frame:SetPoint('CENTER', 0, 0);
	frame:SetSize(ConROC.db.profile.windowIconSize, ConROC.db.profile.windowIconSize);
	frame:SetAlpha(ConROC.db.profile.transparencyWindow);
	
	fontstring:SetText(spellName);
	fontstring:SetTextColor(Color.r, Color.g, Color.b, 1);
	fontstring:SetPoint('BOTTOM', frame, 'TOP', 0, 2);
	fontstring:SetWidth(ConROC.db.profile.windowIconSize + 20);
	fontstring:SetHeight(ConROC.db.profile.windowIconSize);
	fontstring:SetJustifyV("BOTTOM");	
	
	fontkey:SetParent(frame);
	fontkey:SetText(ConROC:FindKeybinding(id));
	fontkey:SetPoint('TOP', frame, 'BOTTOM', 0, -2);
	fontkey:SetTextColor(1, 1, 1, 1);
	
	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('WindowIcon' .. id, 'BACKGROUND');
		t:SetTexture(spellTexture);
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end
	
	t:SetAllPoints(frame);

	tinsert(self.WindowFrames, frame);
	return frame;
end

function ConROC:DefenseWindowFrame()
	local frame = CreateFrame("Frame", "ConROCDefenseWindow", UIParent);
		frame:SetMovable(true);
		frame:SetClampedToScreen(true);
		frame:RegisterForDrag("LeftButton");
		frame:SetScript("OnEnter", TDWOnEnter);
		frame:SetScript("OnLeave", TDWOnLeave);
		frame:SetScript("OnDragStart", function(self)
			if ConROC.db.profile.unlockWindow then
				frame:StartMoving()
			end
		end)
		frame:SetScript("OnDragStop", frame.StopMovingOrSizing)		
		frame:EnableMouse(ConROC.db.profile.unlockWindow);
		
		frame:SetPoint("CENTER", -250, 50);
		frame:SetSize(ConROC.db.profile.windowIconSize * .75, ConROC.db.profile.windowIconSize * .75);
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('4');
		if ConROC.db.profile.combatWindow then
			frame:Hide();
		elseif not ConROC.db.profile.enableDefenseWindow then
			frame:Hide();
		else
			frame:Show();
		end
	local t = frame.texture;
		if not t then
			t = frame:CreateTexture("ARTWORK")
			t:SetTexture('Interface\\AddOns\\ConROC\\images\\shield2');
			t:SetBlendMode('ADD');
			t:SetAlpha(ConROC.db.profile.transparencyWindow);
			local color = ConROC.db.profile.defenseOverlayColor;
			t:SetVertexColor(color.r, color.g, color.b);
			frame.texture = t;
		end
		
		t:SetAllPoints(frame)
		
	local cd = CreateFrame("Cooldown", "ConROCDefWindowCooldown", frame, "CooldownFrameTemplate")
		cd:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
		cd:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE")
		cd:RegisterEvent("UNIT_SPELLCAST_DELAYED")
		cd:RegisterEvent("UNIT_SPELLCAST_SENT")
		cd:RegisterEvent("UNIT_SPELLCAST_START")
		cd:SetAllPoints(frame)
		cd:SetFrameStrata('MEDIUM');
		cd:SetFrameLevel('7');			
		if ConROC.db.profile.enableWindowCooldown then
			cd:SetScript("OnEvent",function(self)
				local gcdStart, gcdDuration = GetSpellCooldown(61304)
				local _, _, _, startTimeMS, endTimeMS = CastingInfo();
				local _, _, _, startTimeMSchan, endTimeMSchan = ChannelInfo();
				if not (endTimeMS or endTimeMSchan) then
					cd:SetCooldown(gcdStart, gcdDuration)
				elseif endTimeMSchan then
					local chanStart  = startTimeMSchan / 1000;
					local chanDuration = endTimeMSchan/1000 - GetTime();
					cd:SetCooldown(chanStart, chanDuration)
				else
					local spStart  = startTimeMS / 1000;
					local spDuration = endTimeMS/1000 - GetTime();
					cd:SetCooldown(spStart, spDuration)			
				end
			end)
		end		
end

function ConROC:CreateDefWindow(parent, id)
	local frame = tremove(self.DefWindowFramePool);
	local spellName, _, spellTexture = GetSpellInfo(id);
	local _, Class = UnitClass("player");
	local Color = RAID_CLASS_COLORS[Class];
		if not frame then
			frame = CreateFrame('Frame', 'ConROC_DefWindowSpell_' .. id, parent);
			fontstring = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			fontkey = frame:CreateFontString("ConROC_DefHotKey_" .. id, "ARTWORK", "GameFontHighlight");
		end

	frame:SetParent("ConROCDefenseWindow");
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6');
	frame:SetPoint('CENTER', 0, 0);
	frame:SetSize(ConROC.db.profile.windowIconSize * .75, ConROC.db.profile.windowIconSize * .75);
	frame:SetAlpha(ConROC.db.profile.transparencyWindow);
	
	fontstring:SetText(spellName);
	fontstring:SetTextColor(Color.r, Color.g, Color.b, 1);
	fontstring:SetPoint('BOTTOM', frame, 'TOP', 0, 2);
	fontstring:SetWidth(ConROC.db.profile.windowIconSize / 1.25 + 30);
	fontstring:SetHeight(ConROC.db.profile.windowIconSize / 1.25);
	fontstring:SetJustifyV("BOTTOM");
	
	fontkey:SetParent(frame);
	fontkey:SetText(ConROC:FindKeybinding(id));
	fontkey:SetPoint('TOP', frame, 'BOTTOM', 0, -2);
	fontkey:SetTextColor(1, 1, 1, 1);
	
	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('DefWindowIcon' .. id, 'BACKGROUND');
		t:SetTexture(spellTexture);
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end
	
	t:SetAllPoints(frame);

	tinsert(self.DefWindowFrames, frame);
	return frame;
end

function ConROC:InterruptWindowFrame()
	local frame = CreateFrame("Frame", "ConROCInterruptWindow", UIParent);
		frame:SetMovable(true);
		frame:SetClampedToScreen(true);
		frame:RegisterForDrag("LeftButton");
		frame:SetScript("OnEnter", TIWOnEnter);
		frame:SetScript("OnLeave", TIWOnLeave);
		frame:SetScript("OnDragStart", function(self)
			if ConROC.db.profile.unlockWindow then
				frame:StartMoving()
			end
		end)
		frame:SetScript("OnDragStop", frame.StopMovingOrSizing)		
		frame:EnableMouse(ConROC.db.profile.unlockWindow);
		
		frame:SetPoint("RIGHT", "ConROCWindow", "LEFT", -5, 0);
		frame:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5');
		if ConROC.db.profile.enableInterruptWindow == true and ConROC.db.profile.unlockWindow == true then
			frame:Show();
		else
			frame:Hide();
		end

	local t = frame.texture;
		if not t then
			t = frame:CreateTexture("ARTWORK")
			t:SetTexture('Interface\\AddOns\\ConROC\\images\\lightning-interrupt');
			t:SetBlendMode('BLEND');
			t:SetAlpha(ConROC.db.profile.transparencyWindow);
			t:SetVertexColor(.1, .1, .1);
			frame.texture = t;
		end
		
		t:SetAllPoints(frame)		
end

function ConROC:PurgeWindowFrame()
	local frame = CreateFrame("Frame", "ConROCPurgeWindow", UIParent);
		frame:SetMovable(true);
		frame:SetClampedToScreen(true);
		frame:RegisterForDrag("LeftButton");
		frame:SetScript("OnEnter", TPWOnEnter);
		frame:SetScript("OnLeave", TPWOnLeave);
		frame:SetScript("OnDragStart", function(self)
			if ConROC.db.profile.unlockWindow then
				frame:StartMoving()
			end
		end)
		frame:SetScript("OnDragStop", frame.StopMovingOrSizing)		
		frame:EnableMouse(ConROC.db.profile.unlockWindow);
		
		frame:SetPoint("LEFT", "ConROCWindow", "RIGHT", 5, 0);
		frame:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		frame:SetFrameStrata('MEDIUM');
		frame:SetFrameLevel('5');
		if ConROC.db.profile.enablePurgeWindow == true and ConROC.db.profile.unlockWindow == true then
			frame:Show();
		else
			frame:Hide();
		end

	local t = frame.texture;
		if not t then
			t = frame:CreateTexture("ARTWORK")
			t:SetTexture('Interface\\AddOns\\ConROC\\images\\magiccircle-purge');
			t:SetBlendMode('BLEND');
			t:SetAlpha(ConROC.db.profile.transparencyWindow);
			t:SetVertexColor(.1, .1, .1);
			frame.texture = t;
		end
		
		t:SetAllPoints(frame)		
end


function ConROC:FindKeybinding(id)
	local keybind;
	
		for k, button in pairs(self.Keybinds[id]) do
			for i = 1, 12 do
				if button == 'ElvUI_Bar1Button' .. i then
					button = 'ACTIONBUTTON' .. i;
				elseif button == 'MultiBarBottomLeftButton' .. i or button == 'ElvUI_Bar3Button' .. i then
					button = 'MULTIACTIONBAR1BUTTON' .. i;
				elseif button == 'MultiBarBottomRightButton' .. i or button == 'ElvUI_Bar2Button' .. i then
					button = 'MULTIACTIONBAR2BUTTON' .. i;
				elseif button == 'MultiBarRightButton' .. i or button == 'ElvUI_Bar5Button' .. i then
					button = 'MULTIACTIONBAR3BUTTON' .. i;
				elseif button == 'MultiBarLeftButton' .. i or button == 'ElvUI_Bar4Button' .. i then
					button = 'MultiActionBar4Button' .. i;
				end
				
				keybind = GetBindingKey(button);				
			end
		end

	return keybind;
end

function ConROC:CreateDamageOverlay(parent, id)
	local frame = tremove(self.DamageFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_DamageOverlay_' .. id, parent);
	end
	
	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6');
	frame:SetPoint('CENTER', 0, 5);
	frame:SetWidth(parent:GetWidth() * 1.6);
	frame:SetHeight(parent:GetHeight() * 1.8);
	frame:SetScale(ConROC.db.profile.overlayScale);
	local alpha = 0;
	local alphaSet = ConROC.db.profile.damageOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);
	
	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('GlowDamageOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\skull');
		t:SetBlendMode('ADD');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.damageOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);

	tinsert(self.DamageFrames, frame);
	return frame;
end

function ConROC:CreateDefenseOverlay(parent, id)
	local frame = tremove(self.DefenseFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_DefenseOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 1.6);
	frame:SetHeight(parent:GetHeight() * 1.5);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.defenseOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('GlowDefenseOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\shield2');
		t:SetBlendMode('ADD');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.defenseOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.DefenseFrames, frame);
	return frame;
end

function ConROC:CreateInterruptOverlay(parent, id)
	local frame = tremove(self.InterruptFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_InterruptOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 1.8);
	frame:SetHeight(parent:GetHeight() * 1.8);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.notifierOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityInterruptOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\lightning');
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.interruptOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.InterruptFrames, frame);
	return frame;
end

function ConROC:CreatePurgableOverlay(parent, id)
	local frame = tremove(self.PurgableFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_PurgableOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 2);
	frame:SetHeight(parent:GetHeight() * 2);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.notifierOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityPurgeOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\magiccircle');
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.purgeOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.PurgableFrames, frame);
	return frame;
end

function ConROC:CreateTauntOverlay(parent, id)
	local frame = tremove(self.TauntFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_TauntOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 1.5);
	frame:SetHeight(parent:GetHeight() * 1.5);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.defenseOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityTauntOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\rage');
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.tauntOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.TauntFrames, frame);
	return frame;
end

function ConROC:CreateRaidBuffsOverlay(parent, id)
	local frame = tremove(self.RaidBuffsFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_RaidBuffsOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 1.5);
	frame:SetHeight(parent:GetHeight() * 1.65);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.notifierOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityRaidBuffsOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\plus');
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.raidbuffsOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.RaidBuffsFrames, frame);
	return frame;
end

function ConROC:CreateMovementOverlay(parent, id)
	local frame = tremove(self.MovementFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_MovementOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, -3);
	frame:SetWidth(parent:GetWidth() * 1.65);
	frame:SetHeight(parent:GetHeight() * 1.85);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.notifierOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityMovementOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\arrow');
		t:SetBlendMode('BLEND');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.movementOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.MovementFrames, frame);
	return frame;
end

function ConROC:CreateCoolDownOverlay(parent, id)
	local frame = tremove(self.CoolDownFramePool);
	if not frame then
		frame = CreateFrame('Frame', 'ConROC_CoolDownOverlay_' .. id, parent);
	end

	frame:SetParent(parent);
	frame:SetFrameStrata('MEDIUM');
	frame:SetFrameLevel('6')
	frame:SetPoint('CENTER', 0, 0);
	frame:SetWidth(parent:GetWidth() * 2);
	frame:SetHeight(parent:GetHeight() * 2);
	frame:SetScale(ConROC.db.profile.overlayScale)
	local alpha = 0;
	local alphaSet = ConROC.db.profile.damageOverlayAlpha;
		if alphaSet == true then
			alpha = 1;
		end
	frame:SetAlpha(alpha);

	local t = frame.texture;
	if not t then
		t = frame:CreateTexture('AbilityBurstOverlay', 'OVERLAY');
		t:SetTexture('Interface\\AddOns\\ConROC\\images\\starburst');
		t:SetBlendMode('ADD');
		frame.texture = t;
	end

	t:SetAllPoints(frame);
	local color = ConROC.db.profile.cooldownOverlayColor;
	t:SetVertexColor(color.r, color.g, color.b);
	t:SetAlpha(color.a);
	
	tinsert(self.CoolDownFrames, frame);
	return frame;
end

function ConROC:DestroyWindowFrames()
	local frame;
	for key, frame in pairs(self.WindowFrames) do
		frame:GetParent().ConROCWindowFrames = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.WindowFrames) do
		tinsert(self.WindowFramePool, frame);
		self.WindowFrames[key] = nil;
	end
end

function ConROC:DestroyDefWindowFrames()
	local frame;
	for key, frame in pairs(self.DefWindowFrames) do
		frame:GetParent().ConROCDefWindowFrames = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.DefWindowFrames) do
		tinsert(self.DefWindowFramePool, frame);
		self.DefWindowFrames[key] = nil;
	end
end

function ConROC:DestroyDamageOverlays()
	local frame;
	for key, frame in pairs(self.DamageFrames) do
		frame:GetParent().ConROCDamageOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.DamageFrames) do
		tinsert(self.DamageFramePool, frame);
		self.DamageFrames[key] = nil;
	end
end

function ConROC:DestroyInterruptOverlays()
	local frame;
	for key, frame in pairs(self.InterruptFrames) do
		frame:GetParent().ConROCInterruptOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.InterruptFrames) do
		tinsert(self.InterruptFramePool, frame);
		self.InterruptFrames[key] = nil;
	end
end

function ConROC:DestroyPurgableOverlays()
	local frame;
	for key, frame in pairs(self.PurgableFrames) do
		frame:GetParent().ConROCPurgableOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.PurgableFrames) do
		tinsert(self.PurgableFramePool, frame);
		self.PurgableFrames[key] = nil;
	end
end

function ConROC:DestroyTauntOverlays()
	local frame;
	for key, frame in pairs(self.TauntFrames) do
		frame:GetParent().ConROCTauntOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.TauntFrames) do
		tinsert(self.TauntFramePool, frame);
		self.TauntFrames[key] = nil;
	end
end

function ConROC:DestroyRaidBuffsOverlays()
	local frame;
	for key, frame in pairs(self.RaidBuffsFrames) do
		frame:GetParent().ConROCRaidBuffsOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.RaidBuffsFrames) do
		tinsert(self.RaidBuffsFramePool, frame);
		self.RaidBuffsFrames[key] = nil;
	end
end

function ConROC:DestroyMovementOverlays()
	local frame;
	for key, frame in pairs(self.MovementFrames) do
		frame:GetParent().ConROCMovementOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.MovementFrames) do
		tinsert(self.MovementFramePool, frame);
		self.MovementFrames[key] = nil;
	end
end

function ConROC:DestroyCoolDownOverlays()
	local frame;
	for key, frame in pairs(self.CoolDownFrames) do
		frame:GetParent().ConROCCoolDownOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.CoolDownFrames) do
		tinsert(self.CoolDownFramePool, frame);
		self.CoolDownFrames[key] = nil;
	end
end

function ConROC:DestroyDefenseOverlays()
	local frame;
	for key, frame in pairs(self.DefenseFrames) do
		frame:GetParent().ConROCDefenseOverlays = nil;
		frame:ClearAllPoints();
		frame:Hide();
		frame:SetParent(UIParent);
		frame.width = nil;
		frame.height = nil;
		frame.alpha = nil;
	end
	for key, frame in pairs(self.DefenseFrames) do
		tinsert(self.DefenseFramePool, frame);
		self.DefenseFrames[key] = nil;
	end
end

function ConROC:UpdateButtonGlow()
	local LAB;
	local LBG;
	local origShow;
	local noFunction = function() end;

	if IsAddOnLoaded('ElvUI') then
		LAB = LibStub:GetLibrary('LibActionButton-1.0-ElvUI');
		LBG = LibStub:GetLibrary('LibButtonGlow-1.0');
		origShow = LBG.ShowOverlayGlow;
	elseif IsAddOnLoaded('Bartender4') then
		LAB = LibStub:GetLibrary('LibActionButton-1.0');
	end

end

function ConROC:WindowGlow(frame, id)
	if frame.ConROCWindowFrames and frame.ConROCWindowFrames[id] then
		frame.ConROCWindowFrames[id]:Show();
	else
		if not frame.ConROCWindowFrames then
			frame.ConROCWindowFrames = {};
		end

		frame.ConROCWindowFrames[id] = self:CreateDisplayWindow(frame, id);
		frame.ConROCWindowFrames[id]:Show();
	end
end

function ConROC:DefWindowGlow(frame, id)
	if frame.ConROCDefWindowFrames and frame.ConROCDefWindowFrames[id] then
		frame.ConROCDefWindowFrames[id]:Show();
	else
		if not frame.ConROCDefWindowFrames then
			frame.ConROCDefWindowFrames = {};
		end

		frame.ConROCDefWindowFrames[id] = self:CreateDefWindow(frame, id);
		frame.ConROCDefWindowFrames[id]:Show();
	end
end

function ConROC:DamageGlow(button, id)
	if button.ConROCDamageOverlays and button.ConROCDamageOverlays[id] then
		button.ConROCDamageOverlays[id]:Show();
	else
		if not button.ConROCDamageOverlays then
			button.ConROCDamageOverlays = {};
		end

		button.ConROCDamageOverlays[id] = self:CreateDamageOverlay(button, id);
		button.ConROCDamageOverlays[id]:Show();
	end
end

function ConROC:DefenseGlow(button, id)
	if button.ConROCDefenseOverlays and button.ConROCDefenseOverlays[id] then
		button.ConROCDefenseOverlays[id]:Show();
	else
		if not button.ConROCDefenseOverlays then
			button.ConROCDefenseOverlays = {};
		end

		button.ConROCDefenseOverlays[id] = self:CreateDefenseOverlay(button, id);
		button.ConROCDefenseOverlays[id]:Show();
	end
end

function ConROC:InterruptGlow(button, id)
	if button.ConROCInterruptOverlays and button.ConROCInterruptOverlays[id] then
		button.ConROCInterruptOverlays[id]:Show();
	else
		if not button.ConROCInterruptOverlays then
			button.ConROCInterruptOverlays = {};
		end

		button.ConROCInterruptOverlays[id] = self:CreateInterruptOverlay(button, id);
		button.ConROCInterruptOverlays[id]:Show();
	end
end

function ConROC:PurgableGlow(button, id)
	if button.ConROCPurgableOverlays and button.ConROCPurgableOverlays[id] then
		button.ConROCPurgableOverlays[id]:Show();
	else
		if not button.ConROCPurgableOverlays then
			button.ConROCPurgableOverlays = {};
		end

		button.ConROCPurgableOverlays[id] = self:CreatePurgableOverlay(button, id);
		button.ConROCPurgableOverlays[id]:Show();
	end
end

function ConROC:TauntGlow(button, id)
	if button.ConROCTauntOverlays and button.ConROCTauntOverlays[id] then
		button.ConROCTauntOverlays[id]:Show();
	else
		if not button.ConROCTauntOverlays then
			button.ConROCTauntOverlays = {};
		end

		button.ConROCTauntOverlays[id] = self:CreateTauntOverlay(button, id);
		button.ConROCTauntOverlays[id]:Show();
	end
end

function ConROC:RaidBuffsGlow(button, id)
	if button.ConROCRaidBuffsOverlays and button.ConROCRaidBuffsOverlays[id] then
		button.ConROCRaidBuffsOverlays[id]:Show();
	else
		if not button.ConROCRaidBuffsOverlays then
			button.ConROCRaidBuffsOverlays = {};
		end

		button.ConROCRaidBuffsOverlays[id] = self:CreateRaidBuffsOverlay(button, id);
		button.ConROCRaidBuffsOverlays[id]:Show();
	end
end

function ConROC:MovementGlow(button, id)
	if button.ConROCMovementOverlays and button.ConROCMovementOverlays[id] then
		button.ConROCMovementOverlays[id]:Show();
	else
		if not button.ConROCMovementOverlays then
			button.ConROCMovementOverlays = {};
		end

		button.ConROCMovementOverlays[id] = self:CreateMovementOverlay(button, id);
		button.ConROCMovementOverlays[id]:Show();
	end
end

function ConROC:CoolDownGlow(button, id)
	if button.ConROCCoolDownOverlays and button.ConROCCoolDownOverlays[id] then
		button.ConROCCoolDownOverlays[id]:Show();
	else
		if not button.ConROCCoolDownOverlays then
			button.ConROCCoolDownOverlays = {};
		end

		button.ConROCCoolDownOverlays[id] = self:CreateCoolDownOverlay(button, id);
		button.ConROCCoolDownOverlays[id]:Show();
	end
end

function ConROC:HideWindowGlow(frame, id)
	if frame.ConROCWindowFrames and frame.ConROCWindowFrames[id] then
		frame.ConROCWindowFrames[id]:Hide();
	end
end

function ConROC:HideDefWindowGlow(frame, id)
	if frame.ConROCDefWindowFrames and frame.ConROCDefWindowFrames[id] then
		frame.ConROCDefWindowFrames[id]:Hide();
	end
end

function ConROC:HideDamageGlow(button, id)
	if button.ConROCDamageOverlays and button.ConROCDamageOverlays[id] then
		button.ConROCDamageOverlays[id]:Hide();
	end
end

function ConROC:HideDefenseGlow(button, id)
	if button.ConROCDefenseOverlays and button.ConROCDefenseOverlays[id] then
		button.ConROCDefenseOverlays[id]:Hide();
	end
end

function ConROC:HideCoolDownGlow(button, id)
	if button.ConROCCoolDownOverlays and button.ConROCCoolDownOverlays[id] then
		button.ConROCCoolDownOverlays[id]:Hide();
	end
end

function ConROC:HideInterruptGlow(button, id)
	if button.ConROCInterruptOverlays and button.ConROCInterruptOverlays[id] then
		button.ConROCInterruptOverlays[id]:Hide();
	end
end

function ConROC:HidePurgableGlow(button, id)
	if button.ConROCPurgableOverlays and button.ConROCPurgableOverlays[id] then
		button.ConROCPurgableOverlays[id]:Hide();
	end
end

function ConROC:HideTauntGlow(button, id)
	if button.ConROCTauntOverlays and button.ConROCTauntOverlays[id] then
		button.ConROCTauntOverlays[id]:Hide();
	end
end

function ConROC:HideRaidBuffsGlow(button, id)
	if button.ConROCRaidBuffsOverlays and button.ConROCRaidBuffsOverlays[id] then
		button.ConROCRaidBuffsOverlays[id]:Hide();
	end
end

function ConROC:HideMovementGlow(button, id)
	if button.ConROCMovementOverlays and button.ConROCMovementOverlays[id] then
		button.ConROCMovementOverlays[id]:Hide();
	end
end
	
function ConROC:UpdateRotation()	
	self = ConROC;
	
	self:FetchBlizzard();
	
	if IsAddOnLoaded('Bartender4') then
		self:FetchBartender4();
	end

	if IsAddOnLoaded('ButtonForge') then
		self:FetchButtonForge();
	end
	
	if IsAddOnLoaded('ElvUI') then
		self:FetchElvUI();
	end
	
	if IsAddOnLoaded('Dominos') then
		self:FetchDominos();
	end
	
    if IsAddOnLoaded('DiabolicUI') then
        self:FetchDiabolic();
    end
 
    if IsAddOnLoaded('AzeriteUI') then
        self:FetchAzeriteUI();
    end
end

function ConROC:AddButton(spellID, button, hotkey)
	if spellID then
		if self.Spells[spellID] == nil then
			self.Spells[spellID] = {};
		end
		tinsert(self.Spells[spellID], button);
		
		if self.Keybinds[spellID] == nil then
			self.Keybinds[spellID] = {};
		end

		tinsert(self.Keybinds[spellID], hotkey);
	end
end

function ConROC:AddStandardButton(button, hotkey)
	local type = button:GetAttribute('type');
	if type then
		local actionType = button:GetAttribute(type);
		local id;
		local spellId;

        if type == 'action' then
            local slot = button:GetAttribute('action');
            if not slot or slot == 0 then
                slot = ActionButton_GetPagedID(button);
            end
            if not slot or slot == 0 then
                slot = ActionButton_CalculateAction(button);
            end
 
            if HasAction(slot) then
                type, id = GetActionInfo(slot);
            else
                return;
            end
        end
 
        if type == 'macro' then
            spellId = GetMacroSpell(id);
            if not spellId then
                return;
            end
        elseif type == 'item' then
            spellId = id;
        elseif type == 'spell' then
            spellId = select(7, GetSpellInfo(id));
        end

		self:AddButton(spellId, button, hotkey);
	end
end

function ConROC:DefAddButton(spellID, button)
	if spellID then
		if self.DefSpells[spellID] == nil then
			self.DefSpells[spellID] = {};
		end
		tinsert(self.DefSpells[spellID], button);
		
		if self.Keybinds[spellID] == nil then
			self.Keybinds[spellID] = {};
		end

		tinsert(self.Keybinds[spellID], hotkey);
	end
end

function ConROC:DefAddStandardButton(button, hotkey)
	local type = button:GetAttribute('type');
	if type then
		local actionType = button:GetAttribute(type);
		local id;
		local spellId;

        if type == 'action' then
            local slot = button:GetAttribute('action');
            if not slot or slot == 0 then
                slot = ActionButton_GetPagedID(button);
            end
            if not slot or slot == 0 then
                slot = ActionButton_CalculateAction(button);
            end
 
            if HasAction(slot) then
                type, id = GetActionInfo(slot);
            else
                return;
            end
        end
 
        if type == 'macro' then
            spellId = GetMacroSpell(id);
            if not spellId then
                return;
            end
        elseif type == 'item' then
            spellId = id;
        elseif type == 'spell' then
            spellId = select(7, GetSpellInfo(id));
        end

		self:DefAddButton(spellId, button, hotkey);
	end
end

function ConROC:Fetch()
	self = ConROC;
	if self.rotationEnabled then
		self:DisableRotationTimer();
	end
	self.Spell = nil;

	self:GlowClear();
	self:WindowClear();
	self.Spells = {};
	self.Keybinds = {};
	self.Flags = {};
	self.SpellsGlowing = {};
	self.WindowsGlowing = {};
	
	self:FetchBlizzard();
	

	if IsAddOnLoaded('Bartender4') then
		self:FetchBartender4();
	end

	if IsAddOnLoaded('ButtonForge') then
		self:FetchButtonForge();
	end
	
	if IsAddOnLoaded('ElvUI') then
		self:FetchElvUI();
	end
	
	if IsAddOnLoaded('Dominos') then
		self:FetchDominos();
	end
	
    if IsAddOnLoaded('DiabolicUI') then
        self:FetchDiabolic();
    end
 
    if IsAddOnLoaded('AzeriteUI') then
        self:FetchAzeriteUI();
    end	

	if self.rotationEnabled then
		self:EnableRotationTimer();
		self:InvokeNextSpell();
	end
end

function ConROC:FetchDef()
	self = ConROC;
	if self.defenseEnabled then
		self:DisableDefenseTimer();
	end
	self.Def = nil;

	self:GlowClearDef();
	self:DefWindowClear();	
	self.DefSpells = {};
	self.Flags = {};
	self.DefGlowing = {};
	self.DefWindowsGlowing = {};
	
	self:DefFetchBlizzard();
		
	if IsAddOnLoaded('Bartender4') then
		self:DefFetchBartender4();
	end

	if IsAddOnLoaded('ButtonForge') then
		self:DefFetchButtonForge();
	end
	
	if IsAddOnLoaded('ElvUI') then
		self:DefFetchElvUI();
	end
	
	if IsAddOnLoaded('Dominos') then
		self:DefFetchDominos();
	end

	if IsAddOnLoaded('DiabolicUI') then
        self:DefFetchDiabolic();
    end
 
    if IsAddOnLoaded('AzeriteUI') then
        self:DefFetchAzeriteUI();
    end	
	
	if self.defenseEnabled then
		self:EnableDefenseTimer();
		self:InvokeNextDef();
	end
end

function ConROC:FetchBlizzard()
	local ActionBarsBlizzard = {'Action', 'MultiBarBottomLeft', 'MultiBarBottomRight', 'MultiBarRight', 'MultiBarLeft', 'Stance', 'PetAction'};
	for _, barName in pairs(ActionBarsBlizzard) do
		if barName == 'Stance' then
			local x = GetNumShapeshiftForms();
			for i = 1, x do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;
				local spellID = select(4, GetShapeshiftFormInfo(i));
				self:AddButton(spellID, button, hotkey);
			end
		elseif barName == 'PetAction' then
			for i = 1, 10 do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;
				local spellID = select(7, GetPetActionInfo(i));
				self:AddButton(spellID, button, hotkey);
			end	
		else
			for i = 1, 12 do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;
				self:AddStandardButton(button, hotkey);
			end
		end
	end
end

function ConROC:DefFetchBlizzard()
	local ActionBarsBlizzard = {'Action', 'MultiBarBottomLeft', 'MultiBarBottomRight', 'MultiBarRight', 'MultiBarLeft', 'Stance', 'PetAction'};
	for _, barName in pairs(ActionBarsBlizzard) do
		if barName == 'Stance' then
			local x = GetNumShapeshiftForms();
			for i = 1, x do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;
				local spellID = select(4, GetShapeshiftFormInfo(i));
				self:DefAddButton(spellID, button, hotkey);
			end
		elseif barName == 'PetAction' then
			for i = 1, 10 do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;
				local spellID = select(7, GetPetActionInfo(i));
				self:DefAddButton(spellID, button, hotkey);
			end	
		else
			for i = 1, 12 do
				local button = _G[barName .. 'Button' .. i];
				local hotkey = barName .. 'Button' .. i;			
				self:DefAddStandardButton(button, hotkey);
			end
		end
	end
end


function ConROC:FetchDominos()
	for i = 1, 60 do
		local button = _G['DominosActionButton' .. i];
		if button then
			local slot = ActionButton_GetPagedID(button) or ActionButton_CalculateAction(button) or button:GetAttribute('action') or 0;
			if HasAction(slot) then
				local spellID, _;
				local actionType, id = GetActionInfo(slot);
				if actionType == 'macro' then id = GetMacroSpell(id) end
				if actionType == 'item' then
					spellID = id;
				elseif actionType == 'spell' or (actionType == 'macro' and id) then
					spellID = id;
				end
				if spellID then
					if self.Spells[spellID] == nil then
						self.Spells[spellID] = {};
					end

					tinsert(self.Spells[spellID], button);
					
					if self.Keybinds[spellID] == nil then
						self.Keybinds[spellID] = {};
					end
					
					tinsert(self.Keybinds[spellID], 'DominosActionButton' .. i);
										
				end
			end
		end
	end
end

function ConROC:DefFetchDominos()
	for i = 1, 60 do
		local button = _G['DominosActionButton' .. i];
		if button then
			local slot = ActionButton_GetPagedID(button) or ActionButton_CalculateAction(button) or button:GetAttribute('action') or 0;
			if HasAction(slot) then
				local spellID, _;
				local actionType, id = GetActionInfo(slot);
				if actionType == 'macro' then id = GetMacroSpell(id) end
				if actionType == 'item' then
					spellID = id;
				elseif actionType == 'spell' or (actionType == 'macro' and id) then
					spellID = id;
				end
				if spellID then
					if self.DefSpells[spellID] == nil then
						self.DefSpells[spellID] = {};
					end

					tinsert(self.DefSpells[spellID], button);
					
					if self.Keybinds[spellID] == nil then
						self.Keybinds[spellID] = {};
					end
					
					tinsert(self.Keybinds[spellID], 'DominosActionButton' .. i);
					
				end
			end
		end
	end
end

function ConROC:FetchButtonForge()
	local i = 1;
	while true do
		local button = _G['ButtonForge' .. i];
		if not button then
			break;
		end
		i = i + 1;

		local type = button:GetAttribute('type');
		if type then
			local actionType = button:GetAttribute(type);
			local id;
			local spellId;
			if type == 'macro' then
				local id = GetMacroSpell(actionType);
				if id then
					spellId = select(7, GetSpellInfo(id));
				end
			elseif type == 'item' then
				actionName = GetItemInfo(actionType);
			elseif type == 'spell' then
				spellId = select(7, GetSpellInfo(actionType));
			end
			if spellId then
				if self.Spells[spellId] == nil then
					self.Spells[spellId] = {};
				end

				tinsert(self.Spells[spellId], button);
				
				if self.Keybinds[spellId] == nil then
					self.Keybinds[spellId] = {};
				end
				
				tinsert(self.Keybinds[spellId], 'ButtonForge' .. i);
				 	
			end
		end
	end
end

function ConROC:DefFetchButtonForge()
	local i = 1;
	while true do
		local button = _G['ButtonForge' .. i];
		if not button then
			break;
		end
		i = i + 1;

		local type = button:GetAttribute('type');
		if type then
			local actionType = button:GetAttribute(type);
			local id;
			local spellId;
			if type == 'macro' then
				local id = GetMacroSpell(actionType);
				if id then
					spellId = select(7, GetSpellInfo(id));
				end
			elseif type == 'item' then
				actionName = GetItemInfo(actionType);
			elseif type == 'spell' then
				spellId = select(7, GetSpellInfo(actionType));
			end
			if spellId then
				if self.DefSpells[spellId] == nil then
					self.DefSpells[spellId] = {};
				end

				tinsert(self.DefSpells[spellId], button);
				
				if self.Keybinds[spellId] == nil then
					self.Keybinds[spellId] = {};
				end
				
				tinsert(self.Keybinds[spellId], 'ButtonForge' .. i);
				
			end
		end
	end
end

function ConROC:FetchElvUI()
	local ret = false;
	for x = 1, 10 do
		for i = 1, 12 do
			local button = _G['ElvUI_Bar' .. x .. 'Button' .. i];
			if button then
				local spellId = button:GetSpellId();
				if spellId then
					local actionName, _ = GetSpellInfo(spellId);
					if spellId then
						if self.Spells[spellId] == nil then
							self.Spells[spellId] = {};
						end
						ret = true;
						tinsert(self.Spells[spellId], button);
						
						if self.Keybinds[spellId] == nil then
							self.Keybinds[spellId] = {};
						end
						
						tinsert(self.Keybinds[spellId], 'ElvUI_Bar' .. x .. 'Button' .. i);
						 	
					end
				end
			end
		end
	end
	return ret;
end

function ConROC:DefFetchElvUI()
	local ret = false;
	for x = 1, 10 do
		for i = 1, 12 do
			local button = _G['ElvUI_Bar' .. x .. 'Button' .. i];
			if button then
				local spellId = button:GetSpellId();
				if spellId then
					local actionName, _ = GetSpellInfo(spellId);
					if spellId then
						if self.DefSpells[spellId] == nil then
							self.DefSpells[spellId] = {};
						end
						ret = true;
						tinsert(self.DefSpells[spellId], button);
						
						if self.Keybinds[spellId] == nil then
							self.Keybinds[spellId] = {};
						end
						
						tinsert(self.Keybinds[spellId], 'ElvUI_Bar' .. x .. 'Button' .. i);
						
					end
				end
			end
		end
	end
	return ret;
end

function ConROC:FetchBartender4()
	local ret = false;
	for i = 1, 120 do
		local button = _G['BT4Button' .. i];
		if button then
			local spellId = button:GetSpellId();
			if spellId then
				local actionName, _ = GetSpellInfo(spellId);
				if spellId then
					if self.Spells[spellId] == nil then
						self.Spells[spellId] = {};
					end
					ret = true;
					tinsert(self.Spells[spellId], button);
					
					if self.Keybinds[spellId] == nil then
						self.Keybinds[spellId] = {};
					end
					
					tinsert(self.Keybinds[spellId], 'BT4Button' .. i); 	
					
				end
			end
		end
	end
	return ret;
end

function ConROC:DefFetchBartender4()
	local ret = false;
	for i = 1, 120 do
		local button = _G['BT4Button' .. i];
		if button then
			local spellId = button:GetSpellId();
			if spellId then
				local actionName, _ = GetSpellInfo(spellId);
				if spellId then
					if self.DefSpells[spellId] == nil then
						self.DefSpells[spellId] = {};
					end
					ret = true;
					tinsert(self.DefSpells[spellId], button);
					
					
					if self.Keybinds[spellId] == nil then
						self.Keybinds[spellId] = {};
					end
					
					tinsert(self.Keybinds[spellId], 'BT4Button' .. i); 	
					
				end
			end
		end
	end
	return ret;
end

function ConROC:FetchDiabolic()
    local ActionBarsDiabolic = {'EngineBar1', 'EngineBar2', 'EngineBar3', 'EngineBar4', 'EngineBar5'};
    for _, barName in pairs(ActionBarsDiabolic) do
        for i = 1, 12 do
            local button = _G[barName .. 'Button' .. i];
            if button then
                self:AddStandardButton(button);
            end
        end
    end
end

function ConROC:DefFetchDiabolic()
    local ActionBarsDiabolic = {'EngineBar1', 'EngineBar2', 'EngineBar3', 'EngineBar4', 'EngineBar5'};
    for _, barName in pairs(ActionBarsDiabolic) do
        for i = 1, 12 do
            local button = _G[barName .. 'Button' .. i];
            if button then
                self:AddStandardButton(button);
            end
        end
    end
end

function ConROC:FetchAzeriteUI()
    for i = 1, 24 do
        local button = _G['AzeriteUIActionButton' .. i];
        if button then
            self:AddStandardButton(button);
        end
    end
end

function ConROC:DefFetchAzeriteUI()
    for i = 1, 24 do
        local button = _G['AzeriteUIActionButton' .. i];
        if button then
            self:AddStandardButton(button);
        end
    end
end

function ConROC:Dump()
	local s = '';
	for k, v in pairs(self.Spells) do
		s = s .. ', ' .. k;
	end
	print(s);
end

function ConROC:FindSpell(spellID)
	return self.Spells[spellID];
end

function ConROC:AbilityBurstIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:CoolDownGlow(button, id);
		end
	end
end

function ConROC:AbilityInterruptIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:InterruptGlow(button, id);
		end
	end
end

function ConROC:AbilityPurgeIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:PurgableGlow(button, id);
		end
	end
end

function ConROC:AbilityTauntIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:TauntGlow(button, id);
		end
	end
end

function ConROC:AbilityRaidBuffsIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:RaidBuffsGlow(button, id);
		end
	end
end

function ConROC:AbilityMovementIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:MovementGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityBurstIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HideCoolDownGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityInterruptIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HideInterruptGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityPurgeIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HidePurgableGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityTauntIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HideTauntGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityRaidBuffsIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HideRaidBuffsGlow(button, id);
		end
	end
end

function ConROC:ClearAbilityMovementIndependent(spellID, id)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:HideMovementGlow(button, id);
		end
	end
end

function ConROC:AbilityBurst(spell, condition)
	local incombat = UnitAffectingCombat('player');
	
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
	end
	if condition and not self.Flags[spell] then
		self.Flags[spell] = true;
		self:AbilityBurstIndependent(spell, spell);
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityBurstIndependent(spell, spell);
	end
end

function ConROC:AbilityInterrupt(spell, condition)
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
		self:ClearAbilityInterruptIndependent(spell, spell);		--Trying out 8.2.8
		ConROCInterruptWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		ConROCInterruptWindow.texture:SetVertexColor(.1, .1, .1);
		if UIFrameIsFlashing(ConROCInterruptWindow) then
			UIFrameFlashStop(ConROCInterruptWindow);
			if ConROC.db.profile.unlockWindow == true and ConROC.db.profile.enableInterruptWindow == true then
				ConROCInterruptWindow:Show();				
			end	
		end			
	end
	if condition and not self.Flags[spell] then
	local color = ConROC.db.profile.interruptOverlayColor;
		self.Flags[spell] = true;
		self:AbilityInterruptIndependent(spell, spell);
		ConROCInterruptWindow:SetSize(ConROC.db.profile.flashIconSize * .75, ConROC.db.profile.flashIconSize * .75);
		ConROCInterruptWindow.texture:SetVertexColor(color.r, color.g, color.b);
		if not UIFrameIsFlashing(ConROCInterruptWindow) and ConROC.db.profile.enableInterruptWindow then
			UIFrameFlash(ConROCInterruptWindow, 0.25, 0.25, -1);
		end
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityInterruptIndependent(spell, spell);
		ConROCInterruptWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		ConROCInterruptWindow.texture:SetVertexColor(.1, .1, .1);
		if UIFrameIsFlashing(ConROCInterruptWindow) then
			UIFrameFlashStop(ConROCInterruptWindow);
			if ConROC.db.profile.unlockWindow == true and ConROC.db.profile.enableInterruptWindow == true then
				ConROCInterruptWindow:Show();				
			end			
		end		
	end
end

function ConROC:AbilityPurge(spell, condition)
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
		self:ClearAbilityPurgeIndependent(spell, spell);		
		ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		ConROCPurgeWindow.texture:SetVertexColor(.1, .1, .1);
		if UIFrameIsFlashing(ConROCPurgeWindow) then
			UIFrameFlashStop(ConROCPurgeWindow);
			if ConROC.db.profile.unlockWindow == true and ConROC.db.profile.enablePurgeWindow == true then
				ConROCPurgeWindow:Show();				
			end
		end			
	end
	if condition and not self.Flags[spell] then
	local color = ConROC.db.profile.purgeOverlayColor;	
		self.Flags[spell] = true;
		self:AbilityPurgeIndependent(spell, spell);
		ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .75, ConROC.db.profile.flashIconSize * .75);
		ConROCPurgeWindow.texture:SetVertexColor(color.r, color.g, color.b);
		if not UIFrameIsFlashing(ConROCPurgeWindow) and ConROC.db.profile.enablePurgeWindow then
			UIFrameFlash(ConROCPurgeWindow, 0.25, 0.25, -1);
		end		
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityPurgeIndependent(spell, spell);
		ConROCPurgeWindow:SetSize(ConROC.db.profile.flashIconSize * .25, ConROC.db.profile.flashIconSize * .25);
		ConROCPurgeWindow.texture:SetVertexColor(.1, .1, .1);
		if UIFrameIsFlashing(ConROCPurgeWindow) then
			UIFrameFlashStop(ConROCPurgeWindow);
			if ConROC.db.profile.unlockWindow == true and ConROC.db.profile.enablePurgeWindow == true then
				ConROCPurgeWindow:Show();				
			end			
		end			
	end
end

function ConROC:AbilityTaunt(spell, condition)
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
	end
	if condition and not self.Flags[spell] then
		self.Flags[spell] = true;
		self:AbilityTauntIndependent(spell, spell);
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityTauntIndependent(spell, spell);
	end
end

function ConROC:AbilityRaidBuffs(spell, condition)
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
	end
	if condition and not self.Flags[spell] then
		self.Flags[spell] = true;
		self:AbilityRaidBuffsIndependent(spell, spell);
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityRaidBuffsIndependent(spell, spell);
	end
end

function ConROC:AbilityMovement(spell, condition)
	if self.Flags[spell] == nil then
		self.Flags[spell] = false;
	end
	if condition and not self.Flags[spell] then
		self.Flags[spell] = true;
		self:AbilityMovementIndependent(spell, spell);
	end
	if not condition and self.Flags[spell] then
		self.Flags[spell] = false;
		self:ClearAbilityMovementIndependent(spell, spell);
	end
end

function ConROC:WindowSpell(spellID)
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:WindowGlow(button, spellID);
		end
		self.WindowsGlowing[spellID] = 1;
	end
end

function ConROC:DefWindowSpell(spellID)
	if self.DefSpells[spellID] ~= nil then
		for k, button in pairs(self.DefSpells[spellID]) do
			self:DefWindowGlow(button, spellID);
		end
		self.DefWindowsGlowing[spellID] = 1;
	end
end

function ConROC:GlowSpell(spellID)
	local spellName = GetSpellInfo(spellID);
	if self.Spells[spellID] ~= nil then
		for k, button in pairs(self.Spells[spellID]) do
			self:DamageGlow(button, 'next');
		end
		self.SpellsGlowing[spellID] = 1;
	else
		self:Print(self.Colors.Error .. 'Spell not found on action bars: ' .. ' ' .. spellName .. ' ' .. '(' .. spellID .. ')');
	end
end

function ConROC:GlowDef(spellID)
	local spellName = GetSpellInfo(spellID);
	if self.DefSpells[spellID] ~= nil then
		for k, button in pairs(self.DefSpells[spellID]) do
			self:DefenseGlow(button, 'nextdef');
		end
		self.DefGlowing[spellID] = 1;
	else
		self:Print(self.Colors.Error .. 'Spell not found on action bars: ' .. ' ' .. spellName .. ' ' .. '(' .. spellID .. ')');
	end
end

function ConROC:GlowNextWindow(spellID)
	self:WindowClear();
	self:WindowSpell(spellID);
end

function ConROC:GlowNextDefWindow(spellID)
	self:DefWindowClear();
	self:DefWindowSpell(spellID);
end

function ConROC:GlowNextSpell(spellID)
	self:GlowClear();
	self:GlowSpell(spellID);
end

function ConROC:GlowNextDef(spellID)
	self:GlowClearDef();
	self:GlowDef(spellID);
end

function ConROC:WindowClear()
	for spellID, v in pairs(self.WindowsGlowing) do
		if v == 1 then
			for k, button in pairs(self.Spells[spellID]) do
				self:HideWindowGlow(button, spellID);
			end
			self.WindowsGlowing[spellID] = 0;
		end
	end
end

function ConROC:DefWindowClear()
	for spellID, v in pairs(self.DefWindowsGlowing) do
		if v == 1 then
			for k, button in pairs(self.DefSpells[spellID]) do
				self:HideDefWindowGlow(button, spellID);
			end
			self.DefWindowsGlowing[spellID] = 0;
		end
	end
end

function ConROC:GlowClear()
	for spellID, v in pairs(self.SpellsGlowing) do
		if v == 1 then
			for k, button in pairs(self.Spells[spellID]) do
				self:HideDamageGlow(button, 'next');
			end
			self.SpellsGlowing[spellID] = 0;
		end
	end
end

function ConROC:GlowClearDef()
	for spellID, v in pairs(self.DefGlowing) do
		if v == 1 then
			for k, button in pairs(self.DefSpells[spellID]) do
				self:HideDefenseGlow(button, 'nextdef');
			end
			self.DefGlowing[spellID] = 0;
		end
	end
end

local function TTOnEnter(self)
  GameTooltip:SetOwner(self, "ConROCButtonFrame")
  GameTooltip:SetText("tooltipTitle")  -- This sets the top line of text, in gold.
  GameTooltip:AddLine("This is the contents of my tooltip", 1, 1, 1)
  GameTooltip:Show()
end

local function TTOnLeave(self)
  GameTooltip:Hide()
end