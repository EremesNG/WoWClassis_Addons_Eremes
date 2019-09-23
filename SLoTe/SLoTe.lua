SLoTe = {};
local SLoTe = SLoTe;
-- Fixed Strata Issues to resolve Loot Text being behind Garrison UI, this means Loot Text will always be on top of everything else.
-- Added Spacing to Money Loot Text to prevent the text overlapping on the Gold Icon.
-- New support currencies & other ressources
-- Support Garrison Missions loot
-- Supports Mail item loot
SLoTe.frame = CreateFrame("Frame");
local frame = SLoTe.frame;  
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UI_ERROR_MESSAGE")
frame:RegisterEvent("CHAT_MSG_LOOT")
frame:RegisterEvent("CHAT_MSG_MONEY")
frame:RegisterEvent("CHAT_MSG_CURRENCY")
frame:RegisterEvent("CHAT_MSG_COMBAT_HONOR_GAIN")
--frame:RegisterEvent("SHOW_LOOT_TOAST")
frame:RegisterEvent("LOOT_OPENED")
local Deformat = LibStub("LibDeformat-3.0")

Activation = 0
ShowL = 1
ShowC = 1
ShowH = 1
ShowM = 1
Scale = "1.0"
DisplayIcons = 1
loaded = 0
skipItem = 0
calc = 0
isOpened = 0
recentError = 0
initLoot = 0
itemLink = nil
amount = nil
numItems = nil
BINDING_HEADER_ScrollingLootText = "Scrolling Loot Text";
BINDING_NAME_SLoTe = "On/Off Function";
REPUTATION_HAS_INCREASED_TEXT = "Your reputation with %s has %s increased.";
REPUTATION_HAS_INCREASED_VALUE = "Your reputation has been increased by %d.";
REPUTATION_HAS_DECREASED_TEXT = "Your reputation with %s has %s decreased.";
REPUTATION_HAS_DECREASED_VALUE = "Your reputation has been decreased by %d.";

local YOU_LOOT_MONEY = _G.YOU_LOOT_MONEY
local LOOT_MONEY_SPLIT = _G.LOOT_MONEY_SPLIT
local LOOT_ITEM_SELF_MULTIPLE = _G.LOOT_ITEM_SELF_MULTIPLE
local LOOT_ITEM_SELF = _G.LOOT_ITEM_SELF
local LOOT_ITEM_CREATED_SELF = _G.LOOT_ITEM_CREATED_SELF
local GOLD_AMOUNT = _G.GOLD_AMOUNT
local SILVER_AMOUNT = _G.SILVER_AMOUNT
local COPPER_AMOUNT = _G.COPPER_AMOUNT
local COMBATLOG_HONORAWARD = _G.COMBATLOG_HONORAWARD
local COMBATLOG_HONORGAIN = _G.COMBATLOG_HONORGAIN
local COMBATLOG_HONORGAIN_NO_RANK = _G.COMBATLOG_HONORGAIN_NO_RANK
local CURRENCY_GAINED_MULTIPLE = _G.CURRENCY_GAINED_MULTIPLE
local CURRENCY_GAINED_MULTIPLE_BONUS = _G.CURRENCY_GAINED_MULTIPLE_BONUS
local CURRENCY_GAINED = _G.CURRENCY_GAINED

function frame.OnEvent(self, event, arg1, arg2, arg3)
	CombatText:SetScale(Scale)

	if (event == "ADDON_LOADED") and (loaded == 0) then
		CombatText:SetFrameStrata("TOOLTIP")
		if Activation == 0 then
			ChatFrame1:AddMessage("|cFF1A16CESLoTe initialized, it is |cFFD80000Deactivated|cFF1A16CE, enter |cFFFFFFFF*/SLoTe help* |cFF1A16CEif you need |cFF25C510help |cFF1A16CEit.|r")
			ChatFrame1:AddMessage("New Version of SLoTe coming soon, with GUI configuration, new features and better customization capabilities. See the Scrolling Loot Text Page on Curse.com for more info.")
			ChatFrame1:AddMessage("See the Scrolling Loot Text Page on Curse.com for more info or to report any bugs I may be unaware of.")
			loaded = 1   
			
		elseif Activation == 1 then
			ChatFrame1:AddMessage("|cFF1A16CESLoTe initialized, it is |cFF25C510Activated|cFF1A16CE. enter |cFFFFFFFF*/SLoTe help* |cFF1A16CEif you need |cFFD80000help |cFF1A16CEit.|r")
			ChatFrame1:AddMessage("New Version of SLoTe coming soon, with GUI configuration, new features and better customization capabilities.")
			ChatFrame1:AddMessage("See the Scrolling Loot Text Page on Curse.com for more info or to report any bugs I may be unaware of.")
			loaded = 1
			
		end
	end


	if event == "UI_ERROR_MESSAGE" and arg1 == ERR_INV_FULL and (loaded == 1) then
			CombatText_AddMessage("INVENTORY IS FULL", CombatText_StandardScroll, 1, 0, 0);
	end

	if (loaded == 1) and (event == "LOOT_OPENED") and (ShowL == 0) then

		LootFrame:SetClampedToScreen(false);
		LootFrame:ClearAllPoints();	
		LootFrame:SetPoint("BOTTOMRIGHT", "UIParent", "TOPLEFT", -300, 300);
	end

	if (event == "CHAT_MSG_LOOT") and (loaded == 1) then
		
		itemLink, amount = getLoot(arg1);
		if itemLink then
			local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEqLoc, iTexture, iSellPrice = GetItemInfo(itemLink);
			lootTexture = iTexture;
			lootName = sName;
			lootQuantity = amount;
			rarity = iRarity;
		
			local r, g, b, hex = GetItemQualityColor(rarity);

			local message = ""


			if lootQuantity >= 2 then
				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".."   "..lootQuantity.." x "..lootName, CombatText_StandardScroll, r, g, b);
			else
				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".."   "..lootName, CombatText_StandardScroll, r, g, b);
			end
		end
	end


	if (event == "CHAT_MSG_MONEY") and (loaded == 1) and (ShowM == 1) then
		local moneystring = Deformat(arg1, LOOT_MONEY_SPLIT) or Deformat(arg1, YOU_LOOT_MONEY)
		-- local aIDNumber, aName, aPoints, aCompleted, aMonth, aDay, aYear, aDescription, aFlags, aImage, aRewardText = -- GetAchievementInfo(1180);
                local moneyCopperArray = moneystring:gsub("%D+", "");
               if type(moneyCopperArray) == "table" then
                
                local moneyCopperString = table.concat(moneyCopperArray , "");
                local moneyCopper = tonumber(moneyCopperString);
                local aImage = GetCoinIcon(moneyCopper);
		CombatText_AddMessage("|T".. aImage ..":22:22:-11:-11|t  "..moneystring, CombatText_StandardScroll, 255, 255, 255);
else
                local moneyCopper = tonumber(moneyCopperArray);
                local aImage = GetCoinIcon(moneyCopper);
		CombatText_AddMessage("|T".. aImage ..":22:22:-11:-11|t  "..moneystring, CombatText_StandardScroll, 255, 255, 255);
end




		
		
	end

	if (event == "CHAT_MSG_CURRENCY") and (loaded == 1) and (ShowC == 1) then
		itemLink, amount =  Deformat(arg1, CURRENCY_GAINED_MULTIPLE_BONUS)
		if not amount then
			itemLink, amount =  Deformat(arg1, CURRENCY_GAINED_MULTIPLE) 
		end
		if not amount then
			itemLink = Deformat(arg1, CURRENCY_GAINED)
			amount = 1
		end
		if itemLink then
      			if not amount then
				amount = 1
			end
			local sName, CurrentAmount, iTexture, earnedThisWeek, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(itemLink)
			lootTexture = iTexture;
			lootName = sName;
			lootQuantity = amount;
			
		
			
			if lootQuantity >= 2 then
				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".." "..lootQuantity.." x "..lootName, CombatText_StandardScroll, 255, 255, 255);
			else
				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".." "..lootName, CombatText_StandardScroll, 255, 255, 255);
			end
		end
		
		
	end

	if (event == "CHAT_MSG_COMBAT_HONOR_GAIN") and (loaded == 1) and (ShowH == 1) then
                amount = Deformat(arg1, COMBATLOG_HONORAWARD)
		if not amount then
			amount = Deformat(arg1, COMBATLOG_HONORGAIN) 
		end
		if not amount then
			amount = Deformat(arg1, COMBATLOG_HONORGAIN_NO_RANK) 
		end
		local honor = amount;

		local eFaction, locF = UnitFactionGroup("player");
		if (eFaction == "Horde") then
local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
    itemStackCount, itemEquipLoc, itemTexture, itemSellPrice =
       GetItemInfo("pvpcurrency-honor-horde");
		else
local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
    itemStackCount, itemEquipLoc, itemTexture, itemSellPrice =
       GetItemInfo("pvpcurrency-honor-alliance");	
		end
			
			if honor >= 2 then
				CombatText_AddMessage("|T".. itemTexture ..":22:22:-11:-11|t".." "..honor.." x "..itemName, CombatText_StandardScroll, 255, 255, 255);
			else
				CombatText_AddMessage("|T".. itemTexture ..":22:22:-11:-11|t".." "..itemName, CombatText_StandardScroll, 255, 255, 255);
			end
		
	end

--	if (event == "SHOW_LOOT_TOAST") and (loaded == 1) and (ShowC == 1) then
--		local iType = arg1
--                local itemLink = arg2
--                local amount = arg3
--if iType == "currency" then
--		if itemLink then
--                        local sName, CurrentAmount, iTexture, earnedThisWeek, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(itemLink)
--			--local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEqLoc, iTexture, iSellPrice = GetItemInfo(itemLink);
--			lootTexture = iTexture;
--			lootName = sName;
--			lootQuantity = amount;
--			rarity = iRarity;
--
--		local r = 255;
  --              local g = 255;
    --            local b = 255;
--
--
--			if lootQuantity >= 2 then
--				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".." "..lootQuantity.." x "..lootName, CombatText_StandardScroll, r, g, b);
--			else
--				CombatText_AddMessage("|T".. lootTexture ..":22:22:-11:-11|t".." "..lootName, CombatText_StandardScroll, r, g, b);
--			end
--		end
--	   end
--	end
	

end

function getLoot(chatmsg)
	-- check for multiple-item-loot
	local itemLink, amount = Deformat(chatmsg, LOOT_ITEM_SELF_MULTIPLE)
	if not itemLink then
		itemLink, amount = Deformat(chatmsg, LOOT_ITEM_PUSHED_SELF_MULTIPLE)
	end
	-- check for single-itemloot
	if not itemLink then
		itemLink = Deformat(chatmsg, LOOT_ITEM_SELF)
	end
	if not itemLink then
		itemLink, amount = Deformat(chatmsg, LOOT_ITEM_PUSHED_SELF)
	end


	-- if something has been looted
	if itemLink then
		if not amount then
			amount = 1
		end
		return itemLink, amount
		
	end
end

function SLoTe_Command(msg)
        local cmd, task = msg:match("^(%S*)%s*(.-)$");
	if cmd == "help" then
		ChatFrame1:AddMessage("Use '/SLoTe activate/deactivate' for the whole addon.")
		ChatFrame1:AddMessage("Use '/SLoTe scale 1.0' to adjust the font size (1.0 = 100%)")
		ChatFrame1:AddMessage("Use '/SLoTe loot enable/disable' to toggle if the loot window will be shown.")
                ChatFrame1:AddMessage("Use '/SLoTe money enable/disable' to toggle if money will be shown.")
                ChatFrame1:AddMessage("Use '/SLoTe honor enable/disable' to toggle if honor will be shown.")
                ChatFrame1:AddMessage("Use '/SLoTe currency enable/disable' to toggle if currencies will be shown.")
                ChatFrame1:AddMessage("Use '/SLoTe test' to display a sample message.")
	elseif cmd == "scale" then
		scale(task);
	elseif cmd == "test" then
		testMessage();
	elseif cmd == "activate" or cmd == "enable" then
		activate();
	elseif cmd == "deactivate" or cmd == "disable" then
		deactivate();
	elseif cmd == "loot" and task == "enable" then
		showL();
	elseif cmd == "loot" and task == "disable" then
		hideL();
	elseif cmd == "honor" and task == "enable" then
		showH();
	elseif cmd == "honor" and task == "disable" then
		hideH();
	elseif cmd == "currency" and task == "enable" then
		showC();
	elseif cmd == "currency" and task == "disable" then
		hideC();
	elseif cmd == "money" and task == "enable" then
		showM();
	elseif cmd == "money" and task == "disable" then
		hideM();
	else
		ChatFrame1:AddMessage("|cFF25C510Enter /SLoTe help to show commands.|r")
	end
end

function scale(scale)
		local oldScale = Scale
                local aImage = GetCoinIcon(9999999999);
		CombatText_AddMessage("|T".. aImage ..":22:22:-11:-11|t  ".."Old scale: "..Scale, CombatText_StandardScroll, 255, 255, 255);
		Scale = scale
		CombatText:SetScale(scale)
		CombatText_AddMessage("|T".. aImage ..":22:22:-11:-11|t  ".."New scale: "..Scale, CombatText_StandardScroll, 255, 255, 255);
		ChatFrame1:AddMessage("|cFF25C510Scale set from "..oldScale.." to: |r"..scale)
end

function testMessage()
		CombatText:SetScale(Scale)
                local aImage = GetCoinIcon(9999999999);
		CombatText_AddMessage("|T".. aImage ..":22:22:-11:-11|t  ".."TEST test 0123456789", CombatText_StandardScroll, 255, 255, 255);
end

function activate()
		Activation = 1
		ChatFrame1:AddMessage("|cFF25C510SLoTe activated.|r")
end

function deactivate()
		Activation = 0
		ChatFrame1:AddMessage("|cFFD80000SLoTe deactivated.|r")
end

function showL()
	ChatFrame1:AddMessage("|cFF25C510SLoTeLoot activated.|r")
	ShowL = 0;
end

function hideL()
	ShowL = 1;
	ChatFrame1:AddMessage("|cFFD80000SLoTeLoot deactivated.|r")
end

function showH()
	ChatFrame1:AddMessage("|cFF25C510SLoTeHonor enabled.|r")
	ShowH = 1;
end

function hideH()
	ShowH = 0;
	ChatFrame1:AddMessage("|cFFD80000SLoTeHonor disabled.|r")
end

function showC()
	ChatFrame1:AddMessage("|cFF25C510SLoTeCurrency enabled.|r")
	ShowC = 1;
end

function hideC()
	ShowC = 0;
	ChatFrame1:AddMessage("|cFFD80000SLoTeCurrency disabled.|r")
end

function showM()
	ChatFrame1:AddMessage("|cFF25C510SLoTeMoney enabled.|r")
	ShowM = 1;
end

function hideM()
	ShowM = 0;
	ChatFrame1:AddMessage("|cFFD80000SLoTeMoney disabled.|r")
end

SlashCmdList["SLoTe"] = SLoTe_Command;
SLASH_SLoTe1 = "/SLoTe";

frame:SetScript("OnEvent", frame.OnEvent);