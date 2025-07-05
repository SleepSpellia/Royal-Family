SMODS.Rank({
    key = "Cavalier",
    card_key = "C",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.15,
    hc_atlas = "RF_Cards_Cavalier_hc",
    lc_atlas = "RF_Cards_Cavalier",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "Queen" },
    shorthand = "C",
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
            if card.base.value == "rfCAV_Cavalier" then
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
table.insert(SMODS.Ranks["Jack"].next, "rfCAV_Cavalier")
SMODS.Ranks["Jack"].strength_effect = {
            fixed = 1,
            random = false,
            ignore = false
        }