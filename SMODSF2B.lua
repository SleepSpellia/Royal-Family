--Fool
SMODS.Rank({
    key = "Fool",
    card_key = "F",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.01,
    hc_atlas = "RF_Cards_Fool_hc",
    lc_atlas = "RF_Cards_Fool",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'rfCAV_Pauper' },
    prev = { 'T' },
    shorthand = 'F',
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
            if card.base.value == "rfCAV_Fool" then
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
table.insert(SMODS.Ranks["10"].next, "rfCAV_Fool")

SMODS.Rank({
    key = "Pauper",
    card_key = "P",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.02,
    hc_atlas = "RF_Cards_Pauper_hc",
    lc_atlas = "RF_Cards_Pauper",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'rfCAV_Tradesman' },
    prev = { 'rfCAV_Fool' },
    shorthand = 'P',
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
            if card.base.value == "rfCAV_Pauper" then
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
table.insert(SMODS.Ranks["rfCAV_Fool"].next, "rfCAV_Pauper")
-- Tradesman
SMODS.Rank({
    key = "Tradesman",
    card_key = "Tr",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.03,
    hc_atlas = "RF_Cards_Tradesman_hc",
    lc_atlas = "RF_Cards_Tradesman",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'rfCAV_Merchant' },
    prev = { 'rfCAV_Pauper' },
    shorthand = 'T',
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
            if card.base.value == "rfCAV_Tradesman" then
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
table.insert(SMODS.Ranks["rfCAV_Pauper"].next, "rfCAV_Tradesman")

-- Merchant
SMODS.Rank({
    key = "Merchant",
    card_key = "M",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.04,
    hc_atlas = "RF_Cards_Merchant_hc",
    lc_atlas = "RF_Cards_Merchant",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'rfCAV_Glazier' },
    prev = { 'rfCAV_Tradesman' },
    shorthand = 'M',
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
            if card.base.value == "rfCAV_Merchant" then
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
table.insert(SMODS.Ranks["rfCAV_Tradesman"].next, "rfCAV_Merchant")

-- Glazier
SMODS.Rank({
    key = "Glazier",
    card_key = "G",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.05,
    hc_atlas = "RF_Cards_Glazier_hc",
    lc_atlas = "RF_Cards_Glazier",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'rfCAV_Barrister' },
    prev = { 'rfCAV_Merchant' },
    shorthand = 'G',
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
            if card.base.value == "rfCAV_Glazier" then
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
table.insert(SMODS.Ranks["rfCAV_Merchant"].next, "rfCAV_Glazier")

-- Barrister
SMODS.Rank({
    key = "Barrister",
    card_key = "B",
    pos = { x = 0 },
    nominal = 10,
    face_nominal = 0.06,
    hc_atlas = "RF_Cards_Barrister_hc",
    lc_atlas = "RF_Cards_Barrister",
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'Jack' },
    prev = { 'rfCAV_Glazier' },
    shorthand = 'B',
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
            if card.base.value == "rfCAV_Barrister" then
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
table.insert(SMODS.Ranks["rfCAV_Glazier"].next, "rfCAV_Barrister")
table.insert(SMODS.Ranks["rfCAV_Barrister"].next, "Jack")








