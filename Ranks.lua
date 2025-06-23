-- taken from showdown
local base_suits = {'Diamonds', 'Clubs', 'Hearts', 'Spades'}

local function inject_p_card_suit_compat(suit, rank)
	local card = {
		name = rank.key .. ' of ' .. suit.key,
		value = rank.key,
		suit = suit.key,
		pos = { x = rank.pos.x, y = rank.suit_map[suit.key] or suit.pos.y },
		lc_atlas = rank.suit_map[suit.key] and rank.lc_atlas or suit.lc_atlas,
		hc_atlas = rank.suit_map[suit.key] and rank.hc_atlas or suit.hc_atlas,
	}

	if findInTable(card.suit, base_suits) == -1 then
		if not RGMC.custom_suits[card.suit] then
			tell("Unknown suit for "..card.name)
			card.lc_atlas = 'rgmc_unknownSuit'
			card.hc_atlas = 'rgmc_unknownSuit'
			card.pos = {x = 0, y = 0}
		else
			card.lc_atlas = RGMC.custom_suits[card.suit].lc_atlas
			card.hc_atlas = RGMC.custom_suits[card.suit].hc_atlas
		end
	end
	--tell('Before:')
	--print(G.P_CARDS[suit.card_key .. '_' .. rank.card_key])
	G.P_CARDS[suit.card_key .. '_' .. rank.card_key] = card
	--tell('After:')
	--print(G.P_CARDS[suit.card_key .. '_' .. rank.card_key])
end

-- Knight: goes between Jack and Queen.
local Cavalier = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Cavalier',
    card_key = 'C',
    pos = { x = 6 },
    nominal = 10,
    face_nominal = 0.15,
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'Queen' },
    prev = { 'Jack' },
    shorthand = 'C',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Cavalier
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

-- Vizier: goes between Queen and King
local Vizier = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Vizier',
    card_key = 'V',
    pos = { x = 7 },
    nominal = 10,
    face_nominal = 0.25,
    face = true,
	strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'King' },
    prev = { 'Queen' },
    shorthand = 'V',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Vizier
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}
 -- Un: Above All
local Un = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Un',
    card_key = 'U',
    pos = { x = 9 },
    nominal = 10,
    face = true,
    face_nominal = 10,
    next = { '2' },
    prev = { 'S' },
    shorthand = 'U',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Un
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

-- Sun: Above Ace
local Un = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Sun',
    card_key = 'S',
    pos = { x = 8 },
    nominal = 10,
    face = true,
    face_nominal = 4,
    next = { 'U' },
    prev = { 'King' },
    shorthand = 'S',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Sun
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}


 -- Barrister: Under Barrister, controls Glass cards
local Barrister = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Barrister',
    card_key = 'B',
    pos = { x = 5 },
    nominal = 10,
    face = true,
    face_nominal = 0.9,
    next = { 'Jack' },
    prev = { 'G' },
    shorthand = 'B',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Barrister
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

local Glazier = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Glazier',
    card_key = 'G',
    pos = { x = 4 },
    nominal = 10,
    face = true,
    face_nominal = 0.8,
    next = { 'B' },
    prev = { 'M' },
    shorthand = 'G',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Glazier
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

local Merchant = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Merchant',
    card_key = 'M',
    pos = { x = 3 },
    nominal = 10,
    face = true,
    face_nominal = 0.7,
    next = { 'G' },
    prev = { 'Tr' },
    shorthand = 'M',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Merchant
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

local Tradesman = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Tradesman',
    card_key = 'Tr',
    pos = { x = 2 },
    nominal = 10,
    face = true,
    face_nominal = 0.6,
    next = { 'M' },
    prev = { 'P' },
    shorthand = 'Tr',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Tradesman
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

local Pauper = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Pauper',
    card_key = 'P',
    pos = { x = 1 },
    nominal = 10,
    face = true,
    face_nominal = 0.5,
    next = { 'Tr' },
    prev = { 'F' },
    shorthand = 'P',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Pauper
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}

local Fool = {
    object_type = "Rank",
	hc_atlas = 'RF_Cards_hc',
    lc_atlas = 'RF_Cards',
	hidden = true,
    key = 'Fool',
    card_key = 'F',
    pos = { x = 0 },
    nominal = 10,
    face = true,
    face_nominal = 0.1,
    next = { 'P' },
    prev = { '10' },
    shorthand = 'F',
	straight_edge = false,
	in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return G.GAME and G.GAME.rank_unlocks and G.GAME.rank_unlocks.Fool
    end,
	inject = function(self)
		for _, suit in pairs(SMODS.Suits) do
			inject_p_card_suit_compat(suit, self)
		end
	end,
}








local list = {
     Un,
    Sun,
    King,
    Vizier,
    Queen,
    Cavalier,
    Jack,
    Barrister,
    Glazier,
    Merchant,
    Tradesmen,
    Pauper,
    Fool,
}

return {
    name = "Ranks",
    init = function()

		-- the straights!
		table.insert(SMODS.Ranks["Jack"].next, "Cavalier")
        table.insert(SMODS.Ranks["Queen"].next, "Vizier")
        table.insert(SMODS.Ranks["Ace"].next, "Sun")


		table.insert(SMODS.Ranks["10"].next, "Fool")

        print("Ranks!")
    end,
    items = list
}