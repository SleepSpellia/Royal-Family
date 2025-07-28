SMODS.Rank({
    key = "Un",
    card_key = "U",
    pos = { x = 0 },
    nominal = 13,
    face_nominal = 5,
    hc_atlas = "RF_Cards_Un_hc",
    lc_atlas = "RF_Cards_Un",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "2" },
    shorthand = "U",
	straight_edge = true,
	in_pool = function(self, args)
       if args then
            if args.initial_deck then
                return false
            elseif args.suit ~= "" then
                return true
            end
        end
        for _, card in ipairs(G.playing_cards or {}) do
            if card.base.value == "rfCAV_Un" then
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
	paperback_Stars = 4,
	paperback_Crowns = 5

    }
})