WORS_U_EmoteBook = WORS_U_EmoteBook or {}
WORS_U_EmoteBook.emotes = {

    { name = "Yes", command = "nod" },
    { name = "No", command = "no" },
	{ name = "Bow", command = "Bow" },
    { name = "Angry", command = "angry" }, --OSRS correct
    { name = "Think", command = "think" },
    { name = "Wave", command = "wave" },
	{ name = "Shrug", command = "shrug" },
    { name = "Cheer", command = "cheer" },--OsRS correcthey
    { name = "Beckon", command = "beckon" },	
    { name = "Laugh", command = "laugh" },
    { name = "Joy", command = "Bounce" },
	{ name = "Yawn", command = "Yawn" },--OSRS correct
    { name = "Dance", command = "dance" },
    { name = "Shake", command = "shake" },
	{ name = "Tease", command = "tease" },
	{ name = "Bonk", command = "Bonk" },--OSRS correct
    { name = "Cry", command = "cry" },
	{ name = "Blow", command = "kiss" },
	{ name = "Panic", command = "panic" },
	{ name = "Fart", command = "fart" },
	{ name = "Clap", command = "clap" },
	{ name = "Salute", command = "salute" },

}

-- Initialize saved variables for transparency
WORS_U_MicroMenuSettings = WORS_U_MicroMenuSettings or {
    transparency = 1,  -- Default transparency value
	AutoCloseEnabled = true,
}

-- Transparency levels
local transparencyLevels = {1, 0.75, 0.5, 0.25}
local currentTransparencyIndex = 1

-- Function to load transparency from saved variables
local function LoadTransparency()
    local savedAlpha = WORS_U_MicroMenuSettings.transparency or 1
    WORS_U_EmoteBook.frame:SetAlpha(savedAlpha)  -- Load the transparency value
    print("Transparency loaded:", savedAlpha * 100 .. "%")  -- Debug output
end

-- Function to save transparency on change or logout
local function SaveTransparency()
    WORS_U_MicroMenuSettings.transparency = transparencyLevels[currentTransparencyIndex]
    print("Transparency saved:", WORS_U_MicroMenuSettings.transparency * 100 .. "%")  -- Debug output
end

-- Create the main frame for the custom emote book
WORS_U_EmoteBook.frame = CreateFrame("Frame", "WORS_U_EmoteBookFrame", UIParent)
WORS_U_EmoteBook.frame:SetSize(190, 260)
WORS_U_EmoteBook.frame:SetPoint("CENTER")
WORS_U_EmoteBook.frame:SetBackdrop({
    bgFile = "Interface\\WORS\\OldSchoolBackground2",
    edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
    tile = false, tileSize = 32, edgeSize = 32,
    insets = { left = 5, right = 6, top = 6, bottom = 5 }
})

WORS_U_EmoteBook.frame:Hide()
WORS_U_EmoteBook.frame:SetMovable(true)
WORS_U_EmoteBook.frame:EnableMouse(true)
WORS_U_EmoteBook.frame:RegisterForDrag("LeftButton")
WORS_U_EmoteBook.frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
WORS_U_EmoteBook.frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

-- Create the title for the emote book
local title = WORS_U_EmoteBook.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetText("Emote Book")
title:SetPoint("TOP", WORS_U_EmoteBook.frame, "TOP", 0, -10)  -- Position title
title:SetTextColor(1, 1, 1)  -- Set title color to white

-- Create a scrollable frame for the buttons
local scrollFrame = CreateFrame("ScrollFrame", nil, WORS_U_EmoteBook.frame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(180, 210)  -- Size of the scrollable area
scrollFrame:SetPoint("TOPLEFT", 5, -40)  -- Position it below the title

--Set a backdrop for the scroll frame with the TGA file as the background
-- scrollFrame:SetBackdrop({
    -- bgFile = "Interface\\AddOns\\WORS_U_EmoteBook\\emoteone33.tga", -- Path to your TGA file
    -- edgeFile = nil,
    -- tile = false,
    -- tileSize = 0,
    -- edgeSize = 0,
    -- insets = { left = 0, right = 0, top = 0, bottom = 0 }
-- })

-- Hiding the scroll bar
local scrollBar = scrollFrame.ScrollBar or _G[scrollFrame:GetName() .. "ScrollBar"]
if scrollBar then
    scrollBar:DisableDrawLayer("BACKGROUND")
    scrollBar:GetThumbTexture():SetAlpha(0)

    -- Hide the scroll buttons
    local scrollUpButton = _G[scrollBar:GetName() .. "ScrollUpButton"]
    local scrollDownButton = _G[scrollBar:GetName() .. "ScrollDownButton"]

    scrollUpButton:GetNormalTexture():SetAlpha(0)
    scrollUpButton:GetPushedTexture():SetAlpha(0)
    scrollUpButton:GetDisabledTexture():SetAlpha(0)
    scrollUpButton:GetHighlightTexture():SetAlpha(0)

    scrollDownButton:GetNormalTexture():SetAlpha(0)
    scrollDownButton:GetPushedTexture():SetAlpha(0)
    scrollDownButton:GetDisabledTexture():SetAlpha(0)
    scrollDownButton:GetHighlightTexture():SetAlpha(0)
end




-- Create a container for the buttons
local buttonContainer = CreateFrame("Frame", nil, scrollFrame)
buttonContainer:SetSize(180, 220)  -- Same size as scroll frame to avoid clipping
scrollFrame:SetScrollChild(buttonContainer)



-- Initialize emote buttons
local emoteButtons = {}

local function SetupEmoteButtons()
    -- Clear existing buttons before creating new ones
    for _, button in pairs(emoteButtons) do
        button:Hide()
        button:SetParent(nil)
    end
    wipe(emoteButtons)

    -- Button size configuration
    local buttonWidth = 40  -- Custom width for buttons
    local buttonHeight = 25  -- Custom height for buttons
    local padding = 5
    local columns = 4
    local startX = 2  -- Adjust this value to move buttons away from the left side
    local buttonStartY = -10  -- Starting Y position for buttons (below the title)

    -- Create title label
    local titleLabel = WORS_U_EmoteBook.frame.titleLabel or WORS_U_EmoteBook.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    titleLabel:SetPoint("TOP", 0, -10)  -- Position it at the top center of the frame
    titleLabel:SetText("Emote Book")
    WORS_U_EmoteBook.frame.titleLabel = titleLabel  -- Store it for later reference

    for i, emoteData in ipairs(WORS_U_EmoteBook.emotes) do
        local emoteButton = CreateFrame("Button", nil, buttonContainer, "UIPanelButtonTemplate")
        emoteButton:SetSize(buttonWidth, buttonHeight)

        -- Set up the button border
        emoteButton:SetBackdrop({
            edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border", -- Border texture
            edgeSize = 8,  -- Border thickness
            insets = { left = 2, right = 2, top = 2, bottom = 2 },  -- Insets for border
        })

        -- Hide the default textures
        emoteButton:SetNormalTexture(nil)
        emoteButton:SetPushedTexture(nil)
        emoteButton:SetHighlightTexture(nil)

        -- Calculate position
        local row = math.floor((i - 1) / columns)
        local column = (i - 1) % columns
        emoteButton:SetPoint("TOPLEFT", startX + (buttonWidth + padding) * column, buttonStartY - (buttonHeight + padding) * row)

        -- Set up the button label and text
        emoteButton:SetText(emoteData.name)
        emoteButton:SetNormalFontObject("GameFontNormalSmall")

        -- Set up button functionality
        emoteButton:SetScript("OnClick", function()
            print("Button clicked: " .. emoteData.name)  -- Debug output
            DoEmote(emoteData.command)  -- Use the actual command for each emote
        end)

        table.insert(emoteButtons, emoteButton)
    end

    LoadTransparency()  -- Load the saved transparency when buttons are set up
end


-- Function to update the button's background color
local function UpdateButtonBackground()
    if WORS_U_EmoteBook.frame:IsShown() then
        EmotesMicroButton:GetNormalTexture():SetVertexColor(1, 0, 0) -- Set the color to red
    else
        EmotesMicroButton:GetNormalTexture():SetVertexColor(1, 1, 1) -- Set the color default
    end
end

-- Function to handle EmotesMicroButton clicks
local function OnEmoteClick(self)
    if IsAltKeyDown() then
        -- Cycle through transparency levels
        currentTransparencyIndex = currentTransparencyIndex % #transparencyLevels + 1
        WORS_U_EmoteBook.frame:SetAlpha(transparencyLevels[currentTransparencyIndex])
        SaveTransparency()  -- Save transparency after change
        print("Emote Book Transparency:", transparencyLevels[currentTransparencyIndex] * 100 .. "%")
    else
        -- Standard toggle functionality
        if WORS_U_EmoteBook.frame:IsShown() then
            print("Hiding Emote Book")  -- Debug output
            WORS_U_EmoteBook.frame:Hide()
        else
            print("Showing Emote Book")  -- Debug output
            SetupEmoteButtons()  -- Ensure buttons are set up
            MicroMenu_ToggleFrame(WORS_U_EmoteBook.frame)--:Show()
			
        end
        UpdateButtonBackground()
    end
end

EmotesMicroButton:SetScript("OnClick", OnEmoteClick)



SLASH_WORSUEMOTEBOOK1 = "/worsuemotebook"
SlashCmdList["WORSUEMOTEBOOK"] = function()
    if WORS_U_EmoteBook.frame:IsShown() then
        WORS_U_EmoteBook.frame:Hide()
    else
		SetupEmoteButtons()
        WORS_U_EmoteBook.frame:Show()
    end
end


-- **********************************************************************
-- **********************************************************************
-- ************************OLD CODE FOR TOGGLE BUTTON *******************
-- **********************************************************************
-- **********************************************************************


-- Movable button to toggle emote book
-- WORS_U_EmoteBook.toggleButton = CreateFrame("Button", "WORS_U_EmoteBookToggleButton", UIParent)
-- WORS_U_EmoteBook.toggleButton:SetSize(30, 35)
-- WORS_U_EmoteBook.toggleButton:SetMovable(true)
-- WORS_U_EmoteBook.toggleButton:SetClampedToScreen(true)
-- WORS_U_EmoteBook.toggleButton:EnableMouse(true)
-- WORS_U_EmoteBook.toggleButton:RegisterForDrag("LeftButton")
-- WORS_U_EmoteBook.toggleButton:SetScript("OnDragStart", function(self) self:StartMoving() end)
-- WORS_U_EmoteBook.toggleButton:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

-- -- Custom background texture for the toggle button
-- WORS_U_EmoteBook.toggleButton:SetBackdrop({
    -- bgFile = "Interface\\WORS\\OldSchoolBackground2",
    -- edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
    -- tile = false, tileSize = 32, edgeSize = 16,
    -- insets = { left = 1, right = 1, top = 1, bottom = 1 }
-- })

-- -- Icon texture for the toggle button
-- local icon = WORS_U_EmoteBook.toggleButton:CreateTexture(nil, "ARTWORK")
-- icon:SetSize(25, 25)
-- icon:SetPoint("CENTER")
-- icon:SetTexture("Interface\\Icons\\redhalloweenmask")  -- Replace with your emote icon




-- -- OnClick to toggle the emote book and transparency
-- WORS_U_EmoteBook.toggleButton:SetScript("OnClick", function(self)
    -- if IsAltKeyDown() then
        -- -- Cycle through transparency levels
        -- currentTransparencyIndex = currentTransparencyIndex % #transparencyLevels + 1
        -- WORS_U_EmoteBook.frame:SetAlpha(transparencyLevels[currentTransparencyIndex])
        -- SaveTransparency()  -- Save transparency after change
        -- print("Emote Book Transparency:", transparencyLevels[currentTransparencyIndex] * 100 .. "%")
    -- else
        -- -- Standard toggle functionality
        -- if WORS_U_EmoteBook.frame:IsShown() then
            -- print("Hiding Emote Book")  -- Debug output
            -- WORS_U_EmoteBook.frame:Hide()
        -- else
            -- print("Showing Emote Book")  -- Debug output
            -- SetupEmoteButtons()  -- Ensure buttons are set up
            -- WORS_U_EmoteBook.frame:Show()
        -- end
		-- UpdateButtonBackground()
    -- end
-- end)

-- -- Initial transparency load



-- --EmotesMicroButton:Hide()
-- UpdateButtonBackground()
-- WORS_U_EmoteBook.toggleButton:SetPoint(unpack(WORS_U_EmoteBookButtonPosition or {"CENTER"}))