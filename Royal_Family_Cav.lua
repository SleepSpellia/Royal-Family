SMODS.current_mod.optional_features = { cardareas = { discard = true, deck = true } }
local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end




SMODS.load_file("atlas.lua")()
--SMODS.load_file("blinds.lua")()
SMODS.load_file("pokerhand.lua")()
SMODS.load_file("deck.lua")()
--SMODS.load_file("enhancements.lua")()
--SMODS.load_file("indexes.lua")()
--SMODS.load_file("jokers.lua")()
SMODS.load_file("SMODSCav.lua")()
SMODS.load_file("SMODSVizier.lua")()
SMODS.load_file("SMODS_Sun&Un.lua")()
SMODS.load_file("SMODSUn.lua")()
SMODS.load_file("SMODSF2B.lua")()


--Jokers
SMODS.load_file("jokerwav.lua")()

SMODS.load_file("familytree.lua")()

SMODS.load_file("whoisthefairestofthemall.lua")()
SMODS.load_file("jackofeverytrade.lua")()
SMODS.load_file("retirementplan.lua")()
SMODS.load_file("scrabble.lua")()
SMODS.load_file("terraformingmars.lua")()
SMODS.load_file("wingspan.lua")()
SMODS.load_file("ectocooler.lua")()
SMODS.load_file("jaipur.lua")()
SMODS.load_file("dropout.lua")()
SMODS.load_file("farmersalmanac.lua")()
SMODS.load_file("arknova.lua")()
SMODS.load_file("spacebase.lua")()


SMODS.load_file("crossmod-aiko.lua")()

if next(SMODS.find_mod('CardSleeves')) then assert(SMODS.load_file("Sleeves.lua"))() end
--SMODS.load_file("spectrals.lua")()
--SMODS.load_file("stakes.lua")()
--SMODS.load_file("stickers.lua")()
--SMODS.load_file("tags.lua")()
--SMODS.load_file("vouchers.lua")()
--if next(SMODS.find_mod('paperback')) then assert(SMODS.load_file("apostle.lua"))() end


for _, filename in ipairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "/compat")) do
    if next(SMODS.find_mod(filename:match("^(.*)%.lua$"))) then
        SMODS.load_file("compat/" .. filename)()
    end
end



SMODS.Sound({
    vol = 0.8,
    pitch = 1,
    key = "Royal_Family_Main_Theme_music",
    path = "Royal_Family_Main_Theme_music.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.round_resets.ante < 9) and 10 or false
    end,
})



local main_menu_hook = Game.main_menu
function Game:main_menu(change_context)
    main_menu_hook(self, change_context)
    G.title_top.cards[1]:set_base(G.P_CARDS.C_A, true)
end