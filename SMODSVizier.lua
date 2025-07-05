SMODS.Rank({
    key = "Vizier",
    card_key = "V",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.25,
    hc_atlas = "RF_Cards_Vizier_hc",
    lc_atlas = "RF_Cards_Vizier",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "King" },
    shorthand = "V",
	straight_edge = false,
	in_pool = function(self, args)
       if args then
            if args.initial_deck then
                return true
            elseif args.suit ~= "" then
                return true
            end
        end
        for _, card in ipairs(G.playing_cards or {}) do
            if card.base.value == "rfCAV_Vizier" then
                return true
            end
        end
        return false
    end,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,

    }
})
table.insert(SMODS.Ranks["Queen"].next, "rfCAV_Vizier")
SMODS.Ranks["Queen"].strength_effect = {
            fixed = 1,
            random = false,
            ignore = false
        }