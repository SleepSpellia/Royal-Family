SMODS.Rank({
    key = "Sun",
    card_key = "S",
    pos = { x = 0 },
    nominal = 12,
    face_nominal = 4,
    hc_atlas = "RF_Cards_Sun_hc",
    lc_atlas = "RF_Cards_Sun",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "rfCAV_Un" },
    shorthand = "S",
	straight_edge = false,
	in_pool = function(self, args)
       if args then
            if args.initial_deck then
                return false
            elseif args.suit ~= "" then
                return true
            end
        end
        for _, card in ipairs(G.playing_cards or {}) do
            if card.base.value == "rfCAV_Sun" then
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

SMODS.Ranks['Ace'].strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        }
SMODS.Ranks['Ace'].next = {'rfCAV_Sun'}
SMODS.Ranks['rfCAV_Sun'].next = {'rfCAV_Un'}
SMODS.Ranks['Ace'].straight_edge = false




