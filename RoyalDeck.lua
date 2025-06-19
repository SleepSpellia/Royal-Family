--- STEAMODDED HEADER
--- MOD_NAME: Royal Family
--- MOD_ID: ROYALFAM
--- MOD_AUTHOR: [SleepSpell]
--- MOD_DESCRIPTION: Adds new face cards to the game.
--- PREFIX: xmpl
--- - - - - - - - - - - - - - - - -

--- Sprites
SMODS.Atlas { key = 'RF_Cards', path = 'Royal_Family_Deck.png', px = 71, py = 95 }
SMODS.Atlas { key = 'Face Deck', path = 'Face Deck.png', px = 71, py = 95 }

---Face Rank List High to Low

RF_UTIL.face_ranks = {
  "Un",
  "Sun",
  "King",
  "Vizier",
  "Queen",
  "Cavalier",
  "Jack",
  "Barrister",
  "Glazier",
  "Merchant",
  "Tradesmen",
  "Pauper",
  "Fool",
}



--- Functions used later
function add_card_to_deck(arg_card)
    arg_card:add_to_deck()
    table.insert(G.playing_cards, arg_card)
    G.deck.config.card_limit = G.deck.config.card_limit + 1
    G.deck:emplace(arg_card)
end

function add_joker_to_game(arg_key, arg_loc, arg_joker)
    arg_joker.key = arg_key
    arg_joker.order = #G.P_CENTER_POOLS["Joker"] + 1

    G.P_CENTERS[arg_key] = arg_joker
    table.insert(G.P_CENTER_POOLS["Joker"], arg_joker)
    table.insert(G.P_JOKER_RARITY_POOLS[arg_joker.rarity], arg_joker)

    G.localization.descriptions.Joker[arg_key] = arg_loc
end




SMODS.Back {
    key = "Face",
    atlas = 'Face Deck',
    pos = { x = 0, y = 0 },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
	    local j = 1
                for i = #G.playing_cards, 1, -1 do
                    if i <= 13 then
                        G.playing_cards[x]:change_rank(face_ranks[j])
		                j = j +1
	          if j<= 13 then
		        j = 0
		        end
                        
                    end
                end

                G.GAME.starting_params.night_Deck = true
                return true
            end
        }))
    end,
}

 --- Un
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Un',
    card_key = 'U',
    face_nominal = 1
    face = true
    pos = { x = XXXX},
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'2', '3', '4' },
	
	RF_prev= { 'S' },
	
    shorthand = 'U',
	
	in_pool = RF_rankCheck,
}
 --- Sun
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Sun',
    card_key = 'S',
    face_nominal = 0.9
    face = true
    pos = { x = XXXX },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'U', '2', '3' },
	
	RF_prev= { 'A' },
	
    shorthand = 'S',
	
	in_pool = RF_rankCheck,
}
 --- Vizier
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
    face_nominal =  0.7
    face = true
	
	hidden = true,

    key = 'Vizier',
    card_key = 'V',
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'A', 'S', 'U' },
	
	RF_prev= { 'Q' },
	
    shorthand = 'V',
	
	in_pool = RF_rankCheck,
}
 --- Cavalier

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Cavalier',
    card_key = 'C',
    face_nominal = 0.5
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'Q', 'V', 'K' },
	
	RF_prev= { 'J' },
	
    shorthand = 'C',
	
	in_pool = RF_rankCheck,
}
 --- Barrister

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Barrister',
    face_nominal = 0.3
    face = true
    card_key = 'B',
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'J', 'C', 'Q' },
	
	RF_prev= { 'G' },
	
    shorthand = 'B',
	
	in_pool = RF_rankCheck,
}
 --- Glazier
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Glazier',
    card_key = 'G',
    face_nominal = 0.275
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'B', 'J', 'C' },
	
	RF_prev= { 'M' },
	
    shorthand = 'G',
	
	in_pool = RF_rankCheck,
}
 --- Merchant
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Merchant',
    card_key = 'M',
    face_nominal = 0.25
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'G', 'B', 'J' },
	
	RF_prev= { 'Tr' },
	
    shorthand = 'M',
	
	in_pool = RF_rankCheck,
}

 --- Tradesmen
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Tradesman',
    card_key = 'Tr',
    face_nominal= 0.225
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'M', 'G', 'B' },
	
	RF_prev= { 'P' },
	
    shorthand = 'Tr',
	
	in_pool = RF_rankCheck,
}
 --- Pauper
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Pauper',
    card_key = 'P',
    face_nominal: 0.2
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'Tr', 'M', 'G' },
	
	RF_prev= { 'P' },
	
    shorthand = 'P',
	
	in_pool = RF_rankCheck,
}
 --- Fool
SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Fool',
    card_key = 'F',
    face_nominal = 0.1
    face = true
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'P', 'Tr', 'M' },
	
	RF_prev= { 'T' },
	
    shorthand = 'F',
	
	in_pool = RF_rankCheck,
}


function init_prev_rank_data()
	print("Initialize Remaining Previous Rank Data")
	for _, rank in pairs(SMODS.Ranks) do
		
		--Initialize
		--In case the rank table does not have prev existed
		--Base rank and ROYAL FAM one has them defined manually by default
		if not rank.RF_prev then
			rank.RF_prev= {}
		end
		
		next_rank_list = rank.next
		
		for i=1, #next_rank_list do
			local next_rank = SMODS.Ranks[next_rank_list[i]]
			local RF_prev = next_rank.RF_prev or {}
			
			if not table_has_value(RF_prev, rank.key) then
				table.insert(RF_prev, rank.key)
				next_rank.RF_prev = RF_prev
			end
		end
	end
end

function getPoolRankFlagEnable(rank)
	return (G.GAME and G.GAME.pool_flags[rank] or false)
end




local function RF_rankCheck(self, args)
	if args and args.initial_deck then
        return false
    end
	
	return getPoolRankFlagEnable(self.key)
end



SMODS.Ranks['T'].strength_effect = {
            fixed = T,
            random = false,
            ignore = false
        }
SMODS.Ranks['T'].next = {'F', 'P', 'Tr'}

SMODS.Ranks['Jack'].strength_effect = {
            fixed = J,
            random = false,
            ignore = false
        }
SMODS.Ranks['J'].next = {'C', 'Q', 'V'}

SMODS.Ranks['Queen'].strength_effect = {
            fixed = Q,
            random = false,
            ignore = false
        }
SMODS.Ranks['Q'].next = {'V', 'K', 'S'}


--Change straight edge off from Ace, so it start to look at rank 0 instead
--SMODS.Ranks['Ace'].straight_edge = false
SMODS.Ranks['Ace'].strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        }
SMODS.Ranks['Ace'].next = {'S', 'U', '2'}

--Vanilla Rank Alteration for Set 2
SMODS.Ranks['T'].next = {'Fool', 'Pauper'}


--Add preliminary prev property into vanilla rank list, so the default behavior will always point to this one
local vanilla_rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', 'T', }

for i=#vanilla_rank_list, 2, -1 do
	SMODS.Ranks[vanilla_rank_list[i]].RF_prev= {vanilla_rank_list[i-1]}
end
--Enforcing the new order
SMODS.Ranks['2'].RF_prev= {'U'}
SMODS.Ranks['J'].RF_prev= {'B'}
SMODS.Ranks['C'].RF_prev= {'J'}
SMODS.Ranks['Q'].RF_prev= {'C'}
SMODS.Ranks['V'].RF_prev= {'Q'}
SMODS.Ranks['K'].RF_prev= {'V'}
SMODS.Ranks['S'].RF_prev= {'A'}
SMODS.Ranks['U'].RF_prev= {'S'}

-- Royal Family New Pokerhand

SMODS.PokerHand {
    key = 'Royal Family',
    chips = 120,
    mult = 8,
    l_chips = 50,
    l_mult = 4,
    example = {
        { 'S_K',    true },
        { 'S_V',    true },
        { 'S_Q',    true },
        { 'S_C',    true },
        { 'S_J',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Royal Family',
            description = {
                '5 cards in a row (consecutive ranks) with',
                'all cards sharing the same suit',
                'Starting from Jack, ending at Un.'
            }
        }
    },
    evaluate = function(parts, hand)
        if next(parts._flush) and next(parts._straight) then
            local _strush = SMODS.merge_lists(parts._flush, parts._straight)
            local royal = true
            for j = 1, #_strush do
                local rank = SMODS.Ranks[_strush[j].base.value]
                royal = royal and (rank.key == 'Ace' or rank.key == 'Un' or rank.key == 'Sun' or rank.key == 'Cavalier' or rank.key == 'Queen' or rank.key == 'Vizier' or rank.key == 'King' rank.key == 'Jack')
            end
            if royal then return {_strush} end
        end
    end,
}

-- New Poker Hand - Family

SMODS.PokerHand {
    key = 'Family',
    chips = 20,
    mult = 5,
    l_chips = 10,
    l_mult = 2,
    example = {
        { 'S_M',    true },
        { 'S_V',    true },
        { 'S_G',    true },
        { 'S_B',    true },
        { 'S_F',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Family',
            description = {
                '5 face cards with',
                'all cards sharing the same suit.'
            }
        }
    },
    evaluate = function(parts, hand)
        if next(parts._flush) then
            for j = 1, #_strush do
                local rank = SMODS.Ranks[_strush[j].base.value]
	    local fam = true
                fam = fam and (rank.face)
            end
            if fam then return {_strush} end
        end
    end,
}
-- Royal Family Planet Card

SMODS.Atlas { key = 'Explorer', path = 'Explorer.png', px = 71, py = 95 }

SMODS.Consumable {
    set = 'Planet',
    key = 'Explorer',
    --! `h_` prefix was removed
    config = { hand_type = 'Royal Family' },
    pos = {x = 0, y = 0 },
    atlas = 'Explorer',
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize('k_planet_q'), get_type_colour(self or card.config, card), nil, 1.2)
    end,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Explorer'
        }
    }
}


SMODS.Atlas { key = 'Pioneer', path = 'Pioneer.png', px = 71, py = 95 }

SMODS.Consumable {
    set = 'Planet',
    key = 'Pioneer',
    --! `h_` prefix was removed
    config = { hand_type = 'Family' },
    pos = {x = 0, y = 0 },
    atlas = 'Pioneer',
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize('k_planet_q'), get_type_colour(self or card.config, card), nil, 1.2)
    end,
    process_loc_text = function(self)
        --use another planet's loc txt instead
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key].text = target_text
    end,
    generate_ui = 0,
    loc_txt = {
        ['en-us'] = {
            name = 'Pioneer'
        }
    }
}




