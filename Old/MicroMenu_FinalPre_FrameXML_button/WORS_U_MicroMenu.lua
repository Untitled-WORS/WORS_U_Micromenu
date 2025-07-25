-- WORS_U_MagicPrayer.lua
local LastOpenedSpellORPrayerFrame = nil
MicroMenu_Frames = {WORS_U_SpellBookFrame, WORS_U_PrayBookFrame, WORS_U_EmoteBookFrame, WORS_U_MusicPlayerFrame, CombatStylePanel} -- MicroMenu frames AND CombatStylePanel

-- function to hide all Micromenu, CombatStylePanel and Backpack frames
function MicroMenu_HideAll()
    for _, frame in ipairs(MicroMenu_Frames) do
        -- Always set strata/level
        if frame == WORS_U_SpellBookFrame or frame == WORS_U_PrayBookFrame then
            frame:SetFrameStrata("HIGH")
            frame:SetFrameLevel(10)
        else
            frame:SetFrameStrata("HIGH")
            frame:SetFrameLevel(20)
        end

        -- Only hide SpellBook and PrayBook if not combat-locked
        if not (InCombatLockdown() and (frame == WORS_U_SpellBookFrame or frame == WORS_U_PrayBookFrame)) then
            frame:Hide()
        end
    end

    CloseBackpack()
    UpdateSpellMicroButtonBackground()
end

-- function used to toggle between Micromenu, CombatStylePanel and Backpack frames
function MicroMenu_ToggleFrame(targetFrame)
    if InCombatLockdown() then
        if targetFrame == WORS_U_SpellBookFrame or targetFrame == WORS_U_PrayBookFrame then
            --print("|cff00ff00MicroMenu: You cannot open or close Spell / Prayer Book in combat.|r")
            return
        end        
    end

    local function isMicroMenuFrame(frame)
        for _, f in ipairs(MicroMenu_Frames) do
            if f == frame then return true end
        end
        return false
    end

    if targetFrame:IsShown() then
        targetFrame:Hide()
        if isMicroMenuFrame(targetFrame) then
            RestoreMicroButtonsFromMicroMenu()
        end
    else
        if WORS_U_MicroMenuSettings.AutoCloseEnabled then
            MicroMenu_HideAll()
        end

        -- Enforce exclusivity between books
        if targetFrame == WORS_U_SpellBookFrame and not InCombatLockdown() then
            WORS_U_PrayBookFrame:Hide()
            LastOpenedSpellORPrayerFrame = WORS_U_SpellBookFrame
        elseif targetFrame == WORS_U_PrayBookFrame and not InCombatLockdown() then
            WORS_U_SpellBookFrame:Hide()
            LastOpenedSpellORPrayerFrame = WORS_U_PrayBookFrame
        end

        -- Show the target frame
        targetFrame:Show()

        -- Stealth-load the last used Spell or Prayer book if opening something else
        if not InCombatLockdown() and targetFrame ~= WORS_U_SpellBookFrame and targetFrame ~= WORS_U_PrayBookFrame and LastOpenedSpellORPrayerFrame and not LastOpenedSpellORPrayerFrame:IsShown() then
            local otherFrames = (LastOpenedSpellORPrayerFrame == WORS_U_SpellBookFrame) and WORS_U_PrayBookFrame or WORS_U_SpellBookFrame
            if otherFrames and otherFrames:IsShown() then
                otherFrames:Hide()
            end
            LastOpenedSpellORPrayerFrame:SetFrameStrata("HIGH")
            LastOpenedSpellORPrayerFrame:SetFrameLevel(10)
            LastOpenedSpellORPrayerFrame:Show()
        end
		
        if isMicroMenuFrame(targetFrame) then
            AttachMicroButtonsTo(targetFrame)
        end
    end

    -- Update the micromenu button appearance for spell / prayer after toggling
    UpdateSpellMicroButtonBackground()
	UpdatePrayMicroButtonBackground()
end

-- Hook Backpack and CombatStylePanels functions
local function HookAFrames()
    if not WORS_U_MicroMenuSettings.AutoCloseEnabled then return end
    if Backpack then
        local pos = WORS_U_MicroMenuSettings.MicroMenuPOS
        if pos then
            local ref = pos.relativeTo and _G[pos.relativeTo] or UIParent
            Backpack:ClearAllPoints()
            Backpack:SetPoint(pos.point, ref, pos.relativePoint, pos.xOfs, pos.yOfs)
            Backpack:SetUserPlaced(false)
        end
		--Backpack:SetWidth( Backpack:GetWidth() +  12 )

		-- Hock onShow to auto close Micromenu and CombatStylePannel
		Backpack:HookScript("OnShow", function()
            if WORS_U_MicroMenuSettings.AutoCloseEnabled then
                if not InCombatLockdown() then
					if LastOpenedSpellORPrayerFrame then
						LastOpenedSpellORPrayerFrame:Show()
					else
						WORS_U_SpellBook.frame:Show()
					end				
				end	
                WORS_U_EmoteBook.frame:Hide()
                WORS_U_MusicBook.musicPlayer:Hide()
                CombatStylePanel:Hide()
            end
			AttachMicroButtonsTo(Backpack)
			UpdateSpellMicroButtonBackground()
			UpdatePrayMicroButtonBackground()
        end)
		
		-- Hock OnHide to Restore MicroButtonsFromMicroMenu and update spell and prayer micromenu button
		Backpack:HookScript("OnHide", function()
			RestoreMicroButtonsFromMicroMenu()
			UpdateSpellMicroButtonBackground()
			UpdatePrayMicroButtonBackground()
        end)
		
		-- Hock OnDragStart to hide stelth loaded Spell and Prayer frames when moving backpack
		hooksecurefunc(Backpack, "OnDragStart", function(self)
			if InCombatLockdown() then return end
			WORS_U_SpellBook.frame:Hide()
			WORS_U_PrayBook.frame:Hide()
		end)
		
		-- Hock StopMovingOrSizing to save new postion to all frames
		hooksecurefunc(Backpack, "StopMovingOrSizing", function(self)
			if not WORS_U_MicroMenuSettings.AutoCloseEnabled then return end
			SaveFramePosition(self)
			if InCombatLockdown() then return end
			WORS_U_SpellBook.frame:Show()
		end)	
    end
    if CombatStylePanel then
        local pos = WORS_U_MicroMenuSettings.MicroMenuPOS
        if pos then
            local ref = pos.relativeTo and _G[pos.relativeTo] or UIParent
            CombatStylePanel:ClearAllPoints()
            CombatStylePanel:SetPoint(pos.point, ref, pos.relativePoint, pos.xOfs, pos.yOfs)
            CombatStylePanel:SetUserPlaced(false)
        end		
		-- 1) Hide combatstylebg one line for loop
		for _, r in ipairs({CombatStylePanel:GetRegions()}) do if r:GetObjectType()=="Texture" then r:Hide() end end

		CombatStylePanel:SetFrameStrata("HIGH")
		CombatStylePanel:SetFrameLevel(50)
		CombatStylePanel:Raise()
		CombatStylePanel:SetSize(180, 330)		

		-- Hock onShow to auto close Micromenu and Backpack
		CombatStylePanel:HookScript("OnShow", function()
			CombatStylePanel:SetFrameStrata("HIGH")
			CombatStylePanel:SetFrameLevel(50)
			CombatStylePanel:Raise()
			
			if WORS_U_MicroMenuSettings.AutoCloseEnabled then
                if not InCombatLockdown() then
					if LastOpenedSpellORPrayerFrame then
						LastOpenedSpellORPrayerFrame:Show()
					else
						WORS_U_SpellBook.frame:Show()
					end
                end
                WORS_U_EmoteBook.frame:Hide()
                WORS_U_MusicBook.musicPlayer:Hide()
                CloseBackpack()
            end
			AttachMicroButtonsTo(CombatStylePanel)
			UpdateSpellMicroButtonBackground()
			UpdatePrayMicroButtonBackground()
        end)
		
		-- Hock OnHide to Restore MicroButtonsFromMicroMenu and update spell and prayer micromenu button
		CombatStylePanel:HookScript("OnHide", function()
			RestoreMicroButtonsFromMicroMenu()
			UpdateSpellMicroButtonBackground()
			UpdatePrayMicroButtonBackground()
        end)
		
		-- Hock OnDragStart to hide stelth loaded Spell and Prayer frames when moving CombatStylePanel
		CombatStylePanel:HookScript("OnDragStart", function(self)
			if InCombatLockdown() then return end
			WORS_U_SpellBookFrame:Hide()
			WORS_U_PrayBookFrame:Hide()
		end)
		
		-- Hock OnDragStop to save new postion to all frames
		CombatStylePanel:HookScript("OnDragStop", function(self)
			if not WORS_U_MicroMenuSettings.AutoCloseEnabled then return end
			if InCombatLockdown() then return end
			SaveFramePosition(self)
			WORS_U_SpellBookFrame:Show()
			AttachMicroButtonsTo(CombatStylePanel)
			UpdateSpellMicroButtonBackground()
			UpdatePrayMicroButtonBackground()			
		end)		
    end
    
	-- retrys until both A frames are hooked
	if not Backpack and not CombatStylePanel then
        C_Timer.After(0.1, HookAFrames)
    end
end

-- Hook drag-stop on micro-menu frames for saving positions
local function HookMicroMenuFrames()
    if not WORS_U_MicroMenuSettings.AutoCloseEnabled then
        for _, frame in ipairs(MicroMenu_Frames) do
            if frame then frame:SetUserPlaced(true) end
        end
        return
    end
    for _, frame in ipairs(MicroMenu_Frames) do
        if frame then -- Skip Spell, Prayer and CombatStylePanel frames these handle this individually
            if frame ~= WORS_U_SpellBookFrame and frame ~= WORS_U_PrayBookFrame and frame ~= CombatStylePanel then
				
				-- Hock OnDragStart to hide stelth loaded Spell and Prayer frames when moving another frame
				frame:HookScript("OnDragStart", function(self)
					if InCombatLockdown() then return end
					WORS_U_SpellBookFrame:Hide()
					WORS_U_PrayBookFrame:Hide()
				end)
				
				frame:HookScript("OnDragStop", function(self)
					if not WORS_U_MicroMenuSettings.AutoCloseEnabled then return end
					if InCombatLockdown() then return end
					if LastOpenedSpellORPrayerFrame then
						LastOpenedSpellORPrayerFrame:Show()
					else
						WORS_U_SpellBook.frame:Show()
					end
					AttachMicroButtonsTo(frame)	
				end)
				
				-- hock OnShow to stelth load Magic and Prayer frames and attach AttachMicroButtonsTo
				frame:HookScript("OnShow", function(self)
					if not WORS_U_MicroMenuSettings.AutoCloseEnabled then return end
					if InCombatLockdown() then return end
					if LastOpenedSpellORPrayerFrame then
						LastOpenedSpellORPrayerFrame:Show()
					else
						WORS_U_SpellBook.frame:Show()
					end
					AttachMicroButtonsTo(frame)	
				end)
            end
			
			-- hock OnHide on ALL Micromenu frames to restore micromenu buttons
			frame:HookScript("OnHide", RestoreMicroButtonsFromMicroMenu) 
        end
    end
end

-- Main initialization event
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.5, function()
            HookAFrames()
            HookMicroMenuFrames()
			local spellbookTriggered = false
			C_Timer.NewTicker(0.2, function(ticker)
				if spellbookTriggered then
					ticker:Cancel()
					return
				end
				if not InCombatLockdown() then
					--print("[MagicMicro] Out of combat: Showing spellbook and opening backpack")
					InventoryMicroButton:Click()
					SaveFramePosition(Backpack)
					WORS_U_SpellBookFrame:Show()
					InventoryMicroButton:Click()
					WORS_U_SpellBookFrame:Hide()
					spellbookTriggered = true
					ticker:Cancel()
				else
					--print("[MagicMicro] Still in combat: Waiting...")
				end
			end)		
        end)
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)

------------------------------------------------------------------------
---------------- Interface Addon Options -------------------------------
------------------------------------------------------------------------

local optionsFrame = CreateFrame("Frame", "MicroMenuOptionsFrame", InterfaceOptionsFramePanelContainer)
optionsFrame.name = "MicroMenu"
-- Create a scroll frame
local scrollFrame = CreateFrame("ScrollFrame", "MicroMenuOptionsScrollFrame", optionsFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(550, 540) -- Set the desired size of the scroll frame
scrollFrame:SetPoint("TOPLEFT", 16, -16)
local contentFrame = CreateFrame("Frame", "MicroMenuOptionsContentFrame", scrollFrame)
contentFrame:SetSize(400, 500) -- Set size based on the expected total content height
scrollFrame:SetScrollChild(contentFrame)
-- Create a title
local title = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 0, 0)
title:SetText("Micro Menu Options")

-- Create checkbox for pinToBackpack
local autoCloseEnabledCheckbox = CreateFrame("CheckButton", "MicroMenuAutoCloseEnabledCheckbox", contentFrame, "InterfaceOptionsCheckButtonTemplate")
autoCloseEnabledCheckbox:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 10, -10)
autoCloseEnabledCheckbox.text = autoCloseEnabledCheckbox:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
autoCloseEnabledCheckbox.text:SetPoint("LEFT", autoCloseEnabledCheckbox, "RIGHT", 5, 0)
autoCloseEnabledCheckbox.text:SetText("Enable Auto Close *Not recommended to change not tested much after recent changes likely to be removed*") -- Set the checkbox label
autoCloseEnabledCheckbox:SetScript("OnShow", function(self)
    if WORS_U_MicroMenuSettings.AutoCloseEnabled == true then
        self:SetChecked(true)
    else
        self:SetChecked(false)
    end
end)
autoCloseEnabledCheckbox:SetScript("OnClick", function(self)
	WORS_U_MicroMenuSettings.AutoCloseEnabled = self:GetChecked() == 1 and true or false
	HookAFrames()
	HookMicroMenuFrames()
end)

-- Register the options frame
InterfaceOptions_AddCategory(optionsFrame)
