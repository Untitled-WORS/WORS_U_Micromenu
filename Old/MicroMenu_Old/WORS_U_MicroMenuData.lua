-- Initialize MicroMenu saved variables
WORS_U_MicroMenuSettings = WORS_U_MicroMenuSettings or {
    transparency = 1,  -- Default transparency value
	AutoCloseEnabled = true,
	MicroMenuPOS = { point = "CENTER", relativeTo = nil, relativePoint = "CENTER", xOfs = 0, yOfs = 0 },
	showMagicandPrayer = true,
}



WORS_U_SpellBook = {}
-- WORS_U_SpellBook Data
WORS_U_SpellBook.spells = {
    {level = 0,  name = "Lumbridge Home Teleport",     		id = 99561,  						icon = "Interface\\Icons\\hometele.blp"},
    {level = 1,  name = "Wind Strike",                 		id = 98952,  runes = {["Air Rune"]=1,["Mind Rune"]=1},                          icon = "Interface\\Icons\\windstrike.blp"},
    {level = 3,  name = "Confuse",                     		id = 99311,  runes = {["Body Rune"]=1,["Earth Rune"]=2,["Water Rune"]=3},      icon = "Interface\\Icons\\confuseicon.blp"},
 -- {level = 4,  name = "Enchant Crossbow Bolt (Opal)",		id = nil,    runes = {["Cosmic Rune"]=1,["Fire Rune"]=1},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 5,  name = "Water Strike",                		id = 79535,  runes = {["Water Rune"]=1,["Mind Rune"]=1},                       icon = "Interface\\Icons\\waterstrike.blp"},
    {level = 7,  name = "Lvl-1 Enchant",               		id = 460022, runes = {["Cosmic Rune"]=1,["Water Rune"]=1},   openInv=true,    icon = "Interface\\Icons\\sapphireenchanting.blp"},
 -- {level = 7,  name = "Enchant Crossbow Bolt (Sapphire)", id = nil,    runes = {["Cosmic Rune"]=1,["Water Rune"]=1},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 9,  name = "Earth Strike",                		id = 79540,  runes = {["Earth Rune"]=2,["Mind Rune"]=1},                        icon = "Interface\\Icons\\earthstrike.blp"},
    {level = 11, name = "Weaken",                      		id = 99312,  runes = {["Body Rune"]=1,["Earth Rune"]=3,["Water Rune"]=3},      icon = "Interface\\Icons\\weakenicon.blp"},
    {level = 13, name = "Fire Strike",                 		id = 79545,  runes = {["Fire Rune"]=3,["Mind Rune"]=1},                        icon = "Interface\\Icons\\firestrike.blp"},
 -- {level = 14, name = "Enchant Crossbow Bolt (Jade)",		id = nil,    runes = {["Cosmic Rune"]=1,["Fire Rune"]=1},                       icon = "Interface\\Icons\\enchantdragonstone.blp"},
    {level = 15, name = "Bones to Bananas",            		id = 99313,  runes = {["Nature Rune"]=1,["Earth Rune"]=2,["Water Rune"]=2,["Bones"]=1}, openInv=true, icon = "Interface\\Icons\\bonestobananas.blp"},
    {level = 17, name = "Wind Bolt",                   		id = 79531,  runes = {["Air Rune"]=2,["Chaos Rune"]=1},                         icon = "Interface\\Icons\\windbolt.blp"},
    {level = 19, name = "Curse",                       		id = 99314,  runes = {["Body Rune"]=2,["Earth Rune"]=3,["Water Rune"]=3},      icon = "Interface\\Icons\\curseicon.blp"},
    {level = 20, name = "Bind",                        		id = 99316,  runes = {["Nature Rune"]=2,["Earth Rune"]=3,["Water Rune"]=3},    icon = "Interface\\Icons\\bindicon.blp"},
    {level = 21, name = "Low Level Alchemy",           		id = 114135, runes = {["Nature Rune"]=1,["Fire Rune"]=3},   openInv=true,    icon = "Interface\\Icons\\lowalch.blp"},
    {level = 23, name = "Water Bolt",                  		id = 79536,  runes = {["Water Rune"]=2,["Chaos Rune"]=1},                         icon = "Interface\\Icons\\waterbolt.blp"},
 -- {level = 24, name = "Enchant Crossbow Bolt (Pearl)",	id = nil,    runes = {["Cosmic Rune"]=1,["Water Rune"]=1},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 25, name = "Varrock Teleport",            		id = 114193, runes = {["Law Rune"]=1,["Fire Rune"]=1,["Air Rune"]=3},         icon = "Interface\\Icons\\varrocktele.blp"},
    {level = 27, name = "Lvl-2 Enchant",               		id = 460023, runes = {["Cosmic Rune"]=1,["Earth Rune"]=1}, openInv=true,     icon = "Interface\\Icons\\emeraldenchanting.blp"},
 -- {level = 27, name = "Enchant Crossbow Bolt (Emerald)",  id = nil,    runes = {["Cosmic Rune"]=1,["Earth Rune"]=1},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 29, name = "Earth Bolt",                  		id = 79541,  runes = {["Earth Rune"]=2,["Chaos Rune"]=1},                         icon = "Interface\\Icons\\earthbolt.blp"},
 -- {level = 29, name = "Enchant Crossbow Bolt (Red Topaz)",id = nil,    runes = {["Cosmic Rune"]=1,["Fire Rune"]=1},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 31, name = "Lumbridge Teleport",          		id = 114196, runes = {["Law Rune"]=1,["Earth Rune"]=1,["Air Rune"]=3},         icon = "Interface\\Icons\\lumbridgetele.blp"},
    {level = 33, name = "Telekinetic Grab (Corpse)",   		id = 114134, runes = {["Law Rune"]=1,["Air Rune"]=1},                         icon = "Interface\\Icons\\telegrab.blp"},
    {level = 33, name = "Telekinetic Grab (Gameobject)",	id = 1812,   runes = {["Law Rune"]=1,["Air Rune"]=1},                         icon = "Interface\\Icons\\telegrab.blp"},
    {level = 35, name = "Fire Bolt",                   		id = 79546,  runes = {["Fire Rune"]=3,["Chaos Rune"]=1},                         icon = "Interface\\Icons\\firebolt.blp"},
    {level = 37, name = "Falador Teleport",            		id = 114194, runes = {["Law Rune"]=1,["Water Rune"]=1,["Air Rune"]=3},        icon = "Interface\\Icons\\faladortele.blp"},
    {level = 39, name = "Crumble Undead",              		id = 99317,  runes = {["Earth Rune"]=2,["Air Rune"]=2,["Chaos Rune"]=1},       icon = "Interface\\Icons\\crumbleundead.blp"},
 -- {level = 40, name = "Teleport to House",           		id = nil,    runes = {["Law Rune"]=1,["Earth Rune"]=1,["Air Rune"]=1},           icon = "Interface\\Icons\\teleporttohouse.blp"},
    {level = 41, name = "Wind Blast",                  		id = 79532,  runes = {["Air Rune"]=3,["Death Rune"]=1},                          icon = "Interface\\Icons\\windblast.blp"},
    {level = 43, name = "Superheat Item",              		id = 99318,  runes = {["Fire Rune"]=4,["Nature Rune"]=1},       openInv=true,    icon = "Interface\\Icons\\superheaticon.blp"},
    {level = 45, name = "Camelot Teleport",            		id = 114197, runes = {["Law Rune"]=1,["Air Rune"]=5},                        icon = "Interface\\Icons\\camelottele.blp"},
    {level = 47, name = "Water Blast",                 		id = 79537,  runes = {["Water Rune"]=3,["Death Rune"]=1},                       icon = "Interface\\Icons\\waterblast.blp"},
 -- {level = 48, name = "Kourend Castle Teleport",     		id = nil,    runes = {["Law Rune"]=2,["Soul Rune"]=2},                       icon = "Interface\\Icons\\kourendcastletele.blp"},
    {level = 49, name = "Lvl-3 Enchant",               		id = 460024, runes = {["Cosmic Rune"]=1,["Fire Rune"]=5},   openInv=true,     icon = "Interface\\Icons\\rubyenchanting.blp"},
 -- {level = 49, name = "Enchant Crossbow Bolt (Ruby)", 	id = nil,    runes = {["Cosmic Rune"]=1,["Fire Rune"]=5},                       icon = "Interface\\Icons\\enchantcrossbow.blp"},
 -- {level = 50, name = "Iban Blast",                  		id = nil,    runes = {["Fire Rune"]=5,["Death Rune"]=1},                      icon = "Interface\\Icons\\ibanblast.blp"},
    {level = 50, name = "Snare",                       		id = 99537,  runes = {["Nature Rune"]=2,["Earth Rune"]=4,["Water Rune"]=4},     icon = "Interface\\Icons\\snareicon.blp"},
 -- {level = 50, name = "Magic Dart",                  		id = nil,    runes = {["Air Rune"]=1,["Death Rune"]=1},                       icon = "Interface\\Icons\\magicdart.blp"},
    {level = 51, name = "Ardougne Teleport",           		id = 114198, runes = {["Law Rune"]=2,["Water Rune"]=2},                        icon = "Interface\\Icons\\ardytele.blp"},
    {level = 53, name = "Earth Blast",                 		id = 79542,  runes = {["Earth Rune"]=3,["Death Rune"]=1},                        icon = "Interface\\Icons\\earthblast.blp"},
 -- {level = 54, name = "Civitas illa Fortis Teleport", 	id = nil,    runes = {["Law Rune"]=2,["Fire Rune"]=2},                       icon = "Interface\\Icons\\civitasilafortistele.blp"},
    {level = 55, name = "High Level Alchemy",          		id = 200090, runes = {["Nature Rune"]=1,["Fire Rune"]=5},       openInv=true,    icon = "Interface\\Icons\\highalch.blp"},
    {level = 56, name = "Charge Water Orb",            		id = 99233,  runes = {["Water Rune"]=30,["Cosmic Rune"]=3,["Unpowered Orb"]=1}, openInv=true, icon = "Interface\\Icons\\chargewaterorb.blp"},
    {level = 57, name = "Lvl-4 Enchant",               		id = 460025, runes = {["Cosmic Rune"]=1,["Earth Rune"]=10},    openInv=true,    icon = "Interface\\Icons\\diamondenchanting.blp"},  -- {level = 57, name = "Enchant Crossbow Bolt (Diamond)", id = nil,     runes = {["Cosmic Rune"]=1,["Earth Rune"]=10},                   icon = "Interface\\Icons\\enchantcrossbow.blp"},
    {level = 58, name = "Watchtower Teleport",         		id = 114200, runes = {["Law Rune"]=2,["Earth Rune"]=2},                        icon = "Interface\\Icons\\watchtowertele.blp"},
    {level = 59, name = "Fire Blast",                  		id = 79547,  runes = {["Fire Rune"]=4,["Death Rune"]=1},                       icon = "Interface\\Icons\\fireblast.blp"},
    {level = 60, name = "Charge Earth Orb",            		id = 99234,  runes = {["Earth Rune"]=30,["Cosmic Rune"]=3,["Unpowered Orb"]=1}, openInv=true, icon = "Interface\\Icons\\chargeearthorb.blp"},
 -- {level = 60, name = "Bones to Peaches",            		id = nil,    runes = {["Nature Rune"]=2,["Earth Rune"]=4,["Water Rune"]=4},       icon = "Interface\\Icons\\bonestopeaches.blp"},
 -- {level = 60, name = "Saradomin Strike",            		id = nil,    runes = {["Fire Rune"]=2,["Blood Rune"]=2},                        icon = "Interface\\Icons\\saradominstrike.blp"},
 -- {level = 60, name = "Flames of Zamorak",           		id = nil,    runes = {["Fire Rune"]=2,["Blood Rune"]=2},                        icon = "Interface\\Icons\\flamesofzamorak.blp"},
 -- {level = 60, name = "Claws of Guthix",             		id = nil,    runes = {["Air Rune"]=2,["Blood Rune"]=2},                        icon = "Interface\\Icons\\clawsofguthix.blp"},
    {level = 61, name = "Trollheim Teleport",          		id = 114199, runes = {["Law Rune"]=2,["Fire Rune"]=2},                        icon = "Interface\\Icons\\trollheimtele.blp"},
    {level = 62, name = "Wind Wave",                   		id = 79533,  runes = {["Air Rune"]=5,["Blood Rune"]=1},                       icon = "Interface\\Icons\\windwave.blp"},
    {level = 63, name = "Charge Fire Orb",             		id = 99235,  runes = {["Fire Rune"]=30,["Cosmic Rune"]=3,["Unpowered Orb"]=1}, openInv=true, icon = "Interface\\Icons\\chargefireorb.blp"},
 -- {level = 64, name = "Ape Atoll Teleport",         		id = nil,    runes = {["Law Rune"]=2,["Fire Rune"]=3},                       icon = "Interface\\Icons\\apeatolltele.blp"},
    {level = 65, name = "Water Wave",                 		id = 79538,  runes = {["Water Rune"]=7,["Blood Rune"]=1,["Air Rune"]=5},      icon = "Interface\\Icons\\waterwave.blp"},
    {level = 66, name = "Charge Air Orb",              		id = 99236,  runes = {["Air Rune"]=30,["Cosmic Rune"]=3,["Unpowered Orb"]=1}, openInv=true,  icon = "Interface\\Icons\\chargeairorb.blp"},
 -- {level = 66, name = "Vulnerability",              		id = nil,    runes = {["Body Rune"]=1,["Earth Rune"]=5,["Water Rune"]=5},         icon = "Interface\\Icons\\vulnerability.blp"},
    {level = 68, name = "Lvl-5 Enchant",               		id = 460026, runes = {["Cosmic Rune"]=1,["Earth Rune"]=15},   openInv=true,    icon = "Interface\\Icons\\dragonstoneenchanting.blp"},  -- {level = 68, name = "Enchant Crossbow Bolt (Dragonstone)", id = nil,     runes = {["Cosmic Rune"]=1,["Earth Rune"]=15},                   icon = "Interface\\Icons\\enchantdragonstone.blp"},
    {level = 70, name = "Earth Wave",                  		id = 79543,  runes = {["Earth Rune"]=7,["Blood Rune"]=1},                         icon = "Interface\\Icons\\earthwave.blp"},
 -- {level = 73, name = "Enfeeble",                   		id = nil,    runes = {["Body Rune"]=1,["Earth Rune"]=8,["Water Rune"]=8},           icon = "Interface\\Icons\\enfeeble.blp"},
 -- {level = 74, name = "Teleother Lumbridge",        		id = nil,    runes = {["Law Rune"]=1,["Soul Rune"]=1,["Earth Rune"]=1},            icon = "Interface\\Icons\\teleotherlumbridge.blp"},
    {level = 75, name = "Fire Wave",                  		id = 79548,  runes = {["Fire Rune"]=7,["Blood Rune"]=1},                         icon = "Interface\\Icons\\firewave.blp"},
    {level = 79, name = "Entangle",                    		id = 99315,  runes = {["Nature Rune"]=3,["Earth Rune"]=5,["Water Rune"]=5},      icon = "Interface\\Icons\\entangleicon.blp"},
 -- {level = 80, name = "Stun",                       		id = nil,    runes = {["Body Rune"]=1,["Earth Rune"]=12,["Water Rune"]=12},         icon = "Interface\\Icons\\stunicon.blp"},
    {level = 80, name = "Charge",                      		id = 707049, runes = {["Blood Rune"]=3,["Fire Rune"]=3,["Air Rune"]=3},       icon = "Interface\\Icons\\chargeicon.blp"},
 -- {level = 81, name = "Wind Surge",                 		id = nil,    runes = {["Air Rune"]=7,["Death Rune"]=1},                          icon = "Interface\\Icons\\windsurge.blp"},
 -- {level = 82, name = "Teleother Falador",          		id = nil,    runes = {["Law Rune"]=1,["Soul Rune"]=1,["Water Rune"]=1},             icon = "Interface\\Icons\\teleotherfalador.blp"},
 -- {level = 85, name = "Water Surge",                		id = nil,    runes = {["Water Rune"]=7,["Death Rune"]=1},                         icon = "Interface\\Icons\\watersurge.blp"},
    {level = 85, name = "Tele Block",                  		id = 99542,  runes = {["Law Rune"]=1,["Chaos Rune"]=1,["Death Rune"]=1},      icon = "Interface\\Icons\\teleblockicon.blp"},
 -- {level = 85, name = "Teleport to Target",         		id = nil,    runes = {["Law Rune"]=2,["Soul Rune"]=2},                           icon = "Interface\\Icons\\teleporttotarget.blp"},
 -- {level = 87, name = "Lvl-6 Enchant",               		id = nil,    runes = {["Cosmic Rune"]=1,["Soul Rune"]=20},                        icon = "Interface\\Icons\\lvl6enchant.blp"},
 -- {level = 87, name = "Enchant Crossbow Bolt (Onyx)", 	id = nil,    runes = {["Cosmic Rune"]=1,["Soul Rune"]=20},                        icon = "Interface\\Icons\\enchantonyx.blp"},
 -- {level = 90, name = "Teleother Camelot",          		id = nil,    runes = {["Law Rune"]=1,["Soul Rune"]=1,["Fire Rune"]=1},              icon = "Interface\\Icons\\teleothercamelot.blp"},
 -- {level = 90, name = "Earth Surge",                		id = nil,    runes = {["Earth Rune"]=7,["Death Rune"]=1},                         icon = "Interface\\Icons\\earthsurge.blp"},
 -- {level = 93, name = "Lvl-7 Enchant",               		id = nil,    runes = {["Cosmic Rune"]=1,["Soul Rune"]=20},                        icon = "Interface\\Icons\\lvl7enchant.blp"},
 -- {level = 95, name = "Fire Surge",                 		id = nil,    runes = {["Fire Rune"]=10,["Death Rune"]=1},                        icon = "Interface\\Icons\\firesurge.blp"},
 -- {level = 102, name = "Wind Surge",                 		id = 79534,  runes = {["Air Rune"]=7,["Death Rune"]=1},                         icon = "Interface\\Icons\\windsurge.blp"},
 -- {level = 103, name = "Water Surge",                		id = 79539,  runes = {["Water Rune"]=7,["Death Rune"]=1},                        icon = "Interface\\Icons\\watersurge.blp"},
 -- {level = 104, name = "Earth Surge",                		id = 79544,  runes = {["Earth Rune"]=7,["Death Rune"]=1},                       icon = "Interface\\Icons\\earthsurge.blp"},
 -- {level = 105, name = "Fire Surge",                 		id = 79549,  runes = {["Fire Rune"]=10,["Death Rune"]=1},                      icon = "Interface\\Icons\\firesurge.blp"},
}

WORS_U_SpellBook.runeInfo = {
    ["Air Rune"]    = { itemID = 90120, staffIDs = {90838, 90404} },
    ["Water Rune"]  = { itemID = 90107, staffIDs = {90837, 90533} },
    ["Earth Rune"]  = { itemID = 90067, staffIDs = {90839, 90433, 51348} },
    ["Fire Rune"]   = { itemID = 90070, staffIDs = {90836, 90439, 51348} },
    ["Mind Rune"]   = { itemID = 90090, staffIDs = {} },
    ["Chaos Rune"]  = { itemID = 90052, staffIDs = {} },
    ["Death Rune"]  = { itemID = 90133, staffIDs = {} },
    ["Blood Rune"]  = { itemID = 90125, staffIDs = {} },
	["Body Rune"]   = { itemID = 90038, staffIDs = {} },
    ["Cosmic Rune"] = { itemID = 90130, staffIDs = {} },
    ["Nature Rune"] = { itemID = 90091, staffIDs = {} },
    ["Law Rune"]    = { itemID = 90139, staffIDs = {} },
    ["Soul Rune"]   = { itemID = 566, staffIDs = {} },
    ["Astral Rune"] = { itemID = 90123, staffIDs = {} },
    ["Wrath Rune"]  = { itemID = 90109, staffIDs = {} },
	
	["Bones"] = { itemID = 90039, staffIDs = {} },
	--["Monkey Bones"] = { itemID = 90109, staffIDs = {} },
	["Big Bones"] = { itemID = 90036, staffIDs = {} },
	["Unpowered Orb"] = { itemID = 69420, staffIDs = {} },
}

function WORS_U_SpellBook:HasRequiredRunes(runeTable)
    if runeTable == nil then return true end
	
	for runeName, count in pairs(runeTable) do
        local runeData = self.runeInfo[runeName]
        if runeData then
            local hasRune = GetItemCount(runeData.itemID) >= count
            local hasStaff = false

            -- Check main hand and offhand slots
            for _, slot in ipairs({16, 17}) do
                local equippedID = GetInventoryItemID("player", slot)
                if equippedID then
                    for _, staffID in ipairs(runeData.staffIDs) do
                        if equippedID == staffID then
                            hasStaff = true
                            break
                        end
                    end
                end
                if hasStaff then break end
            end

            if not hasRune and not hasStaff then
                return false
            end

        else
			print("|cff00ff00MicroMenu: |r" .. "|cffff0000Error: |r" .. "|cff00ff00Missing rune data for:", runeName,"|r")
            return false
        end
    end
    return true
end

-- WORS_U_PrayBook Data
WORS_U_PrayBook = {}  -- Create the main table for the PrayBook
WORS_U_PrayBook.prayers = {
    {level=1,  id=79502,  icon="Interface\\Icons\\thickskin.blp",             buffIcon="Interface\\Icons\\active_thickskin.blp"},           -- Thick Skin
    {level=4,  id=79506,  icon="Interface\\Icons\\burststrength.blp",         buffIcon="Interface\\Icons\\active_burststrength.blp"},       -- Burst of Strength
    {level=7,  id=79508,  icon="Interface\\Icons\\claritythought.blp",        buffIcon="Interface\\Icons\\active_claritythought.blp"},      -- Clarity of Thought
    {level=8,  id=79512,  icon="Interface\\Icons\\sharpeye.blp",              buffIcon="Interface\\Icons\\active_sharpeye.blp"},            -- Sharp Eye
    {level=9,  id=79514,  icon="Interface\\Icons\\mysticwill.blp",            buffIcon="Interface\\Icons\\active_mysticwill.blp"},          -- Mystic Will
    {level=10, id=79503,  icon="Interface\\Icons\\rockskin.blp",              buffIcon="Interface\\Icons\\active_rockskin.blp"},            -- Rock Skin
    {level=13, id=79505,  icon="Interface\\Icons\\superhumanstrength.blp",    buffIcon="Interface\\Icons\\active_superhumanstrength.blp"},  -- Superhuman Strength
    {level=16, id=79509,  icon="Interface\\Icons\\improvedreflexes.blp",      buffIcon="Interface\\Icons\\active_improvedreflexes.blp"},    -- Improved Reflexes
    {level=19, id=80019,  icon="Interface\\Icons\\rapidrestore.blp",          buffIcon="Interface\\Icons\\active_rapidrestore.blp"},        -- Rapid Restore
    {level=22, id=79521,  icon="Interface\\Icons\\rapidheal.blp",             buffIcon="Interface\\Icons\\active_rapidheal.blp"},           -- Rapid Heal
    {level=25, id=114131, icon="Interface\\Icons\\protectitem.blp",           buffIcon="Interface\\Icons\\active_protectitem.blp"},         -- Protect Item
    {level=26, id=79511,  icon="Interface\\Icons\\hawkeye.blp",               buffIcon="Interface\\Icons\\active_hawkeye.blp"},             -- Hawk Eye
    {level=27, id=79516,  icon="Interface\\Icons\\mysticlore.blp",            buffIcon="Interface\\Icons\\active_mysticlore.blp"},          -- Mystic Lore
    {level=28, id=79504,  icon="Interface\\Icons\\steelskin.blp",             buffIcon="Interface\\Icons\\active_steelskin.blp"},           -- Steel Skin
    {level=31, id=79507,  icon="Interface\\Icons\\ultimatestrength.blp",      buffIcon="Interface\\Icons\\active_ultimatestrength.blp"},    -- Ultimate Strength
    {level=34, id=79510,  icon="Interface\\Icons\\incrediblereflexes.blp",    buffIcon="Interface\\Icons\\active_incrediblereflexes.blp"},  -- Incredible Reflexes
    {level=37, id=79501,  icon="Interface\\Icons\\magicpray.blp",             buffIcon="Interface\\Icons\\active_magicpray.blp"},           -- Protect from Magic
    {level=40, id=79500,  icon="Interface\\Icons\\rangepray.blp",             buffIcon="Interface\\Icons\\active_rangepray.blp"},           -- Protect from Missiles
    {level=43, id=465,    icon="Interface\\Icons\\meleepray.blp",             buffIcon="Interface\\Icons\\active_meleepray.blp"},           -- Protect from Melee
    {level=44, id=79513,  icon="Interface\\Icons\\eagleeye.blp",             buffIcon="Interface\\Icons\\active_eagleeye.blp"},           -- Eagle Eye
    {level=45, id=79515,  icon="Interface\\Icons\\mysticmight.blp",          buffIcon="Interface\\Icons\\active_mysticmight.blp"}          -- Mystic Might
}


WORS_U_EmoteBook = {}
WORS_U_EmoteBook.emotes = {
    { name = "Yes",   				command = "nod",   	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\1_Yes_emote_icon.tga" },
    { name = "No",    				command = "no",    	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\2_No_emote_icon.tga" },
    { name = "Bow",   				command = "Bow",   	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\3_Bow_emote_icon.tga" },
    { name = "Angry", 				command = "angry", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\4_Angry_emote_icon.tga" },
    { name = "Think",				command = "think", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\5_Think_emote_icon.tga" },
    { name = "Wave",				command = "wave",  	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\6_Wave_emote_icon.tga" },
    { name = "Shrug",				command = "shrug", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\7_Shrug_emote_icon.tga" },
    { name = "Cheer",				command = "cheer", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\8_Cheer_emote_icon.tga" },
    { name = "Beckon",				command = "beckon",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\9_Beckon_emote_icon.tga" },
    { name = "Laugh", 				command = "laugh", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\10_Laugh_emote_icon.tga" },
    { name = "Joy",   				command = "Bounce",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\11_Jump_for_Joy_emote_icon.tga" },
    { name = "Yawn", 				command = "Yawn",  	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\12_Yawn_emote_icon.tga" },
    { name = "Dance", 				command = "dance", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\13_Dance_emote_icon.tga" },
    { name = "Shake", 				command = "shake", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\14_Jig_emote_icon.tga" },
    { name = "Tease", 				command = "tease", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\15_Spin_emote_icon.tga" },
    { name = "Bonk",  				command = "Bonk",  	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\16_Headbang_emote_icon.tga" },
    { name = "Cry",   				command = "cry",   	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\17_Cry_emote_icon.tga" },
    { name = "Blow",  				command = "kiss",  	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\18_Blow_Kiss_emote_icon.tga" },
    { name = "Panic", 				command = "panic", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\19_Panic_emote_icon.tga" },
    { name = "Fart",  				command = "fart", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\20_Raspberry_emote_icon.tga" },
    { name = "Clap",  			   	command = "clap",  	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\21_Clap_emote_icon.tga" },
    { name = "Salute",				command = "salute",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\22_Salute_emote_icon.tga" },
    { name = "Goblin Bow",			command = "bow", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\23_Goblin_Bow_emote_icon.tga" },
    { name = "Goblin Salute",		command = "salute", icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\24_Goblin_Salute_emote_icon.tga" },
    { name = "Glass Box",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\25_Glass_Box_emote_icon.tga" },
    { name = "Climb Rope",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\26_Climb_Rope_emote_icon.tga" },
    { name = "Lean",				command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\27_Lean_emote_icon.tga" },
    { name = "Glass Wall",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\28_Glass_Wall_emote_icon.tga" },
    { name = "Idea",				command = "idea",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\29_Idea_emote_icon.tga" },
    { name = "Stamp",				command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\30_Stamp_emote_icon.tga" },
    { name = "Flap",				command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\31_Flap_emote_icon.tga" },
    { name = "Slap Head",			command = "smack",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\32_Slap_Head_emote_icon.tga" },
    { name = "Zombie Walk",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\33_Zombie_Walk_emote_icon.tga" },
    { name = "Zombie Dance",		command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\34_Zombie_Dance_emote_icon.tga" },
    { name = "Scared",				command = "scared", icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\35_Scared_emote_icon.tga" },
    { name = "Rabbit Hop",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\36_Rabbit_Hop_emote_icon.tga" },
    { name = "Sit Up",				command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\37_Sit_up_emote_icon.tga" },
    { name = "Push Up",				command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\38_Push_up_emote_icon.tga" },
    { name = "Star Jump",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\39_Star_jump_emote_icon.tga" },
    { name = "Jog",					command = "hurry",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\40_Jog_emote_icon.tga" },
    { name = "Flex",				command = "flex",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\41_Flex_emote_icon.tga" },
    { name = "Zombie Hand",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\42_Zombie_Hand_emote_icon.tga" },
    { name = "Hypermobile Drinker",	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\43_Hypermobile_Drinker_emote_icon.tga" },
    { name = "Skill Cape",			command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\44_Skill_Cape_emote_icon.tga" },
    { name = "Air Guitar",        	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\45_Air_Guitar_emote_icon.tga" },
    { name = "Uri Transform",     	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\46_Uri_transform_emote_icon.tga" },
    { name = "Smooth Dance",      	command = "dance", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\47_Smooth_dance_emote_icon.tga" },
    { name = "Crazy Dance",       	command = "dance", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\48_Crazy_dance_emote_icon.tga" },
    { name = "Premier Shield",    	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\49_Premier_Shield_emote_icon.tga" },
    { name = "Explore",           	command = "map",	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\50_Explore_emote_icon.tga" },
    { name = "Relic Unlock",      	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\51_Relic_unlock_emote_icon.tga" },
    { name = "Party",             	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\52_Party_emote_icon.tga" },
    { name = "Trick",             	command = "", 		icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\53_Trick_emote_icon.tga" },
    { name = "Fortis Salute",     	command = "salute", icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\54_Fortis_Salute_emote_icon.tga" },
    { name = "Sit Down",          	command = "sit", 	icon = "Interface\\AddOns\\MicroMenu\\Textures\\EmoteIcon\\55_Sit_down_emote_icon.tga" },
}









-- WORS_U_MusicBook Data
WORS_U_MusicBook = {}
WORS_U_MusicBook.currentTrack = nil
WORS_U_MusicBook.tracks = {
    { name = "Sea Shanty", 		file = "Sound\\RuneScape\\Sea_Shanty_2.ogg" },
    { name = "Harmony", 		file = "Sound\\RuneScape\\Harmony.ogg" },
	{ name = "Harmony 2", 		file = "Sound\\RuneScape\\Harmony_2.ogg" },
	{ name = "Runescape Main", 	file = "Sound\\RuneScape\\Scape_Main.ogg" },
	{ name = "Runescape Theme", file = "Sound\\RuneScape\\Runescape_Theme.ogg" },
	{ name = "Wilderness", 		file = "Sound\\RuneScape\\Wilderness.ogg" },
	{ name = "Wilderness 2", 	file = "Sound\\RuneScape\\Wilderness_2.ogg" },

}

-- Experience Table used to calculate skills level from Reputaion
experienceTable = {
    [1]  = 0,
    [2]  = 83,
    [3]  = 174,
    [4]  = 276,
    [5]  = 388,
    [6]  = 512,
    [7]  = 650,
    [8]  = 801,
    [9]  = 969,
    [10] = 1154,
    [11] = 1358,
    [12] = 1584,
    [13] = 1833,
    [14] = 2107,
    [15] = 2411,
    [16] = 2746,
    [17] = 3115,
    [18] = 3523,
    [19] = 3973,
    [20] = 4470,
    [21] = 5018,
    [22] = 5624,
    [23] = 6291,
    [24] = 7028,
    [25] = 7842,
    [26] = 8740,
    [27] = 9730,
    [28] = 10824,
    [29] = 12031,
    [30] = 13363,
    [31] = 14833,
    [32] = 16456,
    [33] = 18247,
    [34] = 20224,
    [35] = 22406,
    [36] = 24815,
    [37] = 27473,
    [38] = 30408,
    [39] = 33648,
    [40] = 37224,
    [41] = 41171,
    [42] = 45529,
    [43] = 50339,
    [44] = 55649,
    [45] = 61512,
    [46] = 67983,
    [47] = 75127,
    [48] = 83014,
    [49] = 91721,
    [50] = 101333,
    [51] = 111945,
    [52] = 123660,
    [53] = 136594,
    [54] = 150872,
    [55] = 166636,
    [56] = 184040,
    [57] = 203254,
    [58] = 224466,
    [59] = 247886,
    [60] = 273742,
    [61] = 302288,
    [62] = 333804,
    [63] = 368599,
    [64] = 407015,
    [65] = 449428,
    [66] = 496254,
    [67] = 547953,
    [68] = 605032,
    [69] = 668051,
    [70] = 737627,
    [71] = 814445,
    [72] = 899257,
    [73] = 992895,
    [74] = 1096278,
    [75] = 1210421,
    [76] = 1336443,
    [77] = 1475581,
    [78] = 1629200,
    [79] = 1798808,
    [80] = 1986068,
    [81] = 2192818,
    [82] = 2421087,
    [83] = 2673114,
    [84] = 2951373,
    [85] = 3258594,
    [86] = 3597792,
    [87] = 3972294,
    [88] = 4385776,
    [89] = 4842295,
    [90] = 5346332,
    [91] = 5902831,
    [92] = 6517253,
    [93] = 7195629,
    [94] = 7944614,
    [95] = 8771558,
    [96] = 9684577,
    [97] = 10692629,
    [98] = 11805606,
    [99] = 13034431,
}
-- Function to GetLevelFromFactionReputation
function GetLevelFromFactionReputation(factionID)
    local _, _, _, _, _, repValue = GetFactionInfoByID(factionID)
    if not repValue then
        print("|cff00ff00MicroMenu: |r" .. "|cffff0000Error: |r" .. "|cff00ff00Faction ID", factionID, "not found.|r")
        return 1
    end

    local adjustedXP = repValue - 43000
    for level = #experienceTable, 1, -1 do
        if adjustedXP >= experienceTable[level] then
            return level
        end
    end
    return 1
end




function SaveFramePosition(self)
    print("|cff00ff00[MicroMenu Debug]|r SaveFramePosition for", self:GetName())
    if not WORS_U_MicroMenuSettings.AutoCloseEnabled then
        --print("|cff00ff00[MicroMenu Debug]|r AutoClose disabled, marking user-placed")
        for _, f in ipairs(MicroMenu_Frames) do f:SetUserPlaced(true) end
        if Backpack then Backpack:SetUserPlaced(true) end
		if CombatStylePanel then CombatStylePanel:SetUserPlaced(true) end

        return
    end
    -- 1) raw anchor
    local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
    local relName = relativeTo and relativeTo:GetName() or "UIParent"
    --print(string.format("|cff00ff00[MicroMenu Debug]|r raw GetPoint: %s:SetPoint(%s, %s, %s, %.1f, %.1f)", self:GetName(), point, relName, relativePoint, xOfs, yOfs))
    -- 2) persist
    WORS_U_MicroMenuSettings.MicroMenuPOS = {point = point, relativeTo = relName, relativePoint = relativePoint, xOfs = xOfs, yOfs = yOfs}
    local reference = _G[relName] or UIParent

    -- 3) two offset tables
    local bpOffsets = {
        RIGHT       = { -6, -25 }, TOPRIGHT     = { -6, 0 }, BOTTOMRIGHT = { -6, -50 },
        LEFT        = {  6, -25 }, TOPLEFT      = {  6, 0 }, BOTTOMLEFT  = {  6, -50 },
        CENTER      = {  0, -25 }, TOP          = {  0, 0 }, BOTTOM      = {  0, -50 },
    }-- MM ofsets for when backpack is moved to apply to Micromenu frames but is not working atm
    local mmOffsets = {
        RIGHT       = {  6, 25 },   TOPRIGHT    = {  6, 0 }, BOTTOMRIGHT = {  6, 50 },
        LEFT        = { -6, 25 },   TOPLEFT     = { -6, 0 }, BOTTOMLEFT  = { -6, 50 },
        CENTER      = {  0, 25 },   TOP         = {  0, 0 }, BOTTOM      = {  0, 50 },
    }
    local bpX, bpY = unpack(bpOffsets[relativePoint] or { xOfs, yOfs })
    local mmX, mmY = unpack(mmOffsets[relativePoint] or { xOfs, yOfs })

    -- 4a) you dragged the Backpack → move all micro-menu frames with mmOffsets
    if self == Backpack then
        for _, frame in ipairs(MicroMenu_Frames) do
            local fx, fy = mmX, mmY
            print(string.format("|cff00ff00[MicroMenu Debug]|r moving %s relative to Backpack: %s:SetPoint(%s, Backpack, %s, %.1f, %.1f)", frame:GetName(), frame:GetName(), point, relativePoint, fx, fy))
            frame:ClearAllPoints()
            frame:SetPoint(point, Backpack, relativePoint, fx, fy)
            frame:SetUserPlaced(false)
        end
        print(string.format("|cff00ff00[MicroMenu Debug]|r Backpack remains: Backpack:SetPoint(%s, %s, %s, %.1f, %.1f)", point, relName, relativePoint, xOfs, yOfs))
        -- CombatStylePanel:ClearAllPoints()
        -- CombatStylePanel:SetPoint(point, Backpack, relativePoint, fx, fy)
        -- CombatStylePanel:SetUserPlaced(false)     
		Backpack:ClearAllPoints()
        Backpack:SetPoint(point, reference, relativePoint, xOfs, yOfs)
        Backpack:SetUserPlaced(false)
        return
    --end
    -- elseif self == CombatStylePanel then
        -- for _, frame in ipairs(MicroMenu_Frames) do
            -- local fx, fy = mmX, mmY
            -- frame:ClearAllPoints()
            -- frame:SetPoint(point, CombatStylePanel, relativePoint, fx, fy)
            -- frame:SetUserPlaced(false)
        -- end
		-- if CombatStylePanel then
			-- CombatStylePanel:ClearAllPoints()
			-- CombatStylePanel:SetPoint(point, reference, relativePoint, xOfs, yOfs)
			-- CombatStylePanel:SetUserPlaced(false)
		-- end
		-- local bx, by = xOfs + bpX, yOfs + bpY
        -- if Backpack then
			-- Backpack:ClearAllPoints()
			-- Backpack:SetPoint(point, reference, relativePoint, bx, by)
			-- Backpack:SetUserPlaced(false)
		-- end
        -- return
    -- 4b) you dragged a MicroMenu frame → snap peers raw, then move Backpack with bpOffsets
    else
        for _, frame in ipairs(MicroMenu_Frames) do
            if frame ~= self then
                print(string.format("|cff00ff00[MicroMenu Debug]|r snapping %s:SetPoint(%s, %s, %s, %.1f, %.1f)", frame:GetName(), point, relName, relativePoint, xOfs, yOfs))
                frame:ClearAllPoints()
                frame:SetPoint(point, reference, relativePoint, xOfs, yOfs)
                frame:SetUserPlaced(false)
            end
        end
		-- if CombatStylePanel then		
			-- CombatStylePanel:ClearAllPoints()
			-- CombatStylePanel:SetPoint(point, reference, relativePoint, xOfs, yOfs)
			-- CombatStylePanel:SetUserPlaced(false)
		-- end
        if Backpack then
            local bx, by = xOfs + bpX, yOfs + bpY
            print(string.format("|cff00ff00[MicroMenu Debug]|r positioning Backpack:SetPoint(%s, %s, %s, %.1f, %.1f)", point, relName, relativePoint, bx, by))
            Backpack:ClearAllPoints()
            Backpack:SetPoint(point, reference, relativePoint, bx, by)
            Backpack:SetUserPlaced(false)
        end
    end
end

-- function SaveFramePosition(self)
    -- print("|cff00ff00[MicroMenu Debug]|r SaveFramePosition for", self:GetName())

    -- -- If AutoClose is disabled, just mark everything user-placed
    -- if not WORS_U_MicroMenuSettings.AutoCloseEnabled then
        -- for _, f in ipairs(MicroMenu_Frames) do
            -- f:SetUserPlaced(true)
        -- end
        -- if Backpack then Backpack:SetUserPlaced(true) end
        -- if CombatStylePanel then CombatStylePanel:SetUserPlaced(true) end
        -- return
    -- end

    -- -- 1) raw anchor data
    -- local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
    -- local relName = relativeTo and relativeTo:GetName() or "UIParent"
    -- local reference = _G[relName] or UIParent

    -- -- 2) persist to SavedVariables
    -- WORS_U_MicroMenuSettings.MicroMenuPOS = {
        -- point         = point,
        -- relativeTo    = relName,
        -- relativePoint = relativePoint,
        -- xOfs          = xOfs,
        -- yOfs          = yOfs,
    -- }

    -- -- 3) offset tables
    -- local bpOffsets = {
        -- RIGHT       = { -6, -25 }, TOPRIGHT     = { -6,   0 }, BOTTOMRIGHT = { -6, -50 },
        -- LEFT        = {  6, -25 }, TOPLEFT      = {  6,   0 }, BOTTOMLEFT  = {  6, -50 },
        -- CENTER      = {  0, -25 }, TOP          = {  0,   0 }, BOTTOM      = {  0, -50 },
    -- }
    -- local mmOffsets = {
        -- RIGHT       = {  6,  25 }, TOPRIGHT     = {  6,   0 }, BOTTOMRIGHT = {  6,  50 },
        -- LEFT        = { -6,  25 }, TOPLEFT      = { -6,   0 }, BOTTOMLEFT  = { -6,  50 },
        -- CENTER      = {  0,  25 }, TOP          = {  0,   0 }, BOTTOM      = {  0,  50 },
    -- }

    -- local bpX, bpY = unpack(bpOffsets[relativePoint] or { xOfs, yOfs })
    -- local mmX, mmY = unpack(mmOffsets[relativePoint] or { xOfs, yOfs })

    -- -- 4a) Dragging the Backpack
    -- if self == Backpack then
        -- -- move all micro-menu frames + CombatStylePanel relative to Backpack
        -- for _, frame in ipairs(MicroMenu_Frames) do
            -- frame:ClearAllPoints()
            -- frame:SetPoint(point, Backpack, relativePoint, mmX, mmY)
            -- frame:SetUserPlaced(false)
        -- end
        -- if CombatStylePanel then
            -- CombatStylePanel:ClearAllPoints()
            -- CombatStylePanel:SetPoint(point, Backpack, relativePoint, mmX, mmY)
            -- CombatStylePanel:SetUserPlaced(false)
        -- end

        -- -- then re-anchor Backpack itself to its reference
        -- Backpack:ClearAllPoints()
        -- Backpack:SetPoint(point, reference, relativePoint, xOfs, yOfs)
        -- Backpack:SetUserPlaced(false)
        -- return

    -- -- 4b) Dragging the CombatStylePanel
    -- elseif self == CombatStylePanel then
        -- -- move all micro-menu frames relative to CombatStylePanel
        -- for _, frame in ipairs(MicroMenu_Frames) do
            -- frame:ClearAllPoints()
            -- frame:SetPoint(point, CombatStylePanel, relativePoint, mmX, mmY)
            -- frame:SetUserPlaced(false)
        -- end
        -- -- snap CombatStylePanel itself to its reference
        -- CombatStylePanel:ClearAllPoints()
        -- CombatStylePanel:SetPoint(point, reference, relativePoint, xOfs, yOfs)
        -- CombatStylePanel:SetUserPlaced(false)

        -- -- finally reposition Backpack with its offsets
        -- if Backpack then
            -- Backpack:ClearAllPoints()
            -- Backpack:SetPoint(point, reference, relativePoint, xOfs + bpX, yOfs + bpY)
            -- Backpack:SetUserPlaced(false)
        -- end
        -- return

    -- -- 4c) Dragging any other MicroMenu frame
    -- else
        -- -- snap all peers to the raw point
        -- for _, frame in ipairs(MicroMenu_Frames) do
            -- if frame ~= self then
                -- frame:ClearAllPoints()
                -- frame:SetPoint(point, reference, relativePoint, xOfs, yOfs)
                -- frame:SetUserPlaced(false)
            -- end
        -- end
        -- -- include CombatStylePanel in the snap
        -- if CombatStylePanel then
            -- CombatStylePanel:ClearAllPoints()
            -- CombatStylePanel:SetPoint(point, reference, relativePoint, xOfs, yOfs)
            -- CombatStylePanel:SetUserPlaced(false)
        -- end
        -- -- offset Backpack accordingly
        -- if Backpack then
            -- Backpack:ClearAllPoints()
            -- Backpack:SetPoint(point, reference, relativePoint, xOfs + bpX, yOfs + bpY)
            -- Backpack:SetUserPlaced(false)
        -- end
    -- end
-- end
