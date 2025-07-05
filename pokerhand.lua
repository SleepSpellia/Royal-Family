SMODS.PokerHand {
    key = 'Royal Family',
    visible = false,
    above_hand = 'rfCAV_Lineage', 
    chips = 120,
    mult = 8,
    l_chips = 50,
    l_mult = 4,
    example = {
        { 'S_A',    true },
        { 'S_K',    true },
        { 'S_Q',    true },
        { 'S_J',    true },
        { 'S_T',    true },
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
                royal = royal and (rank.key == 'Ace' or rank.key == 'rfCAV_Un' or rank.key == 'rfCAV_Sun' or rank.key == 'rfCAV_Cavalier' or rank.key == 'Queen' or rank.key == 'rfCAV_Vizier' or rank.key == 'King' or rank.key == 'Jack' or rank.key == 'T')
            end
            if royal then return {_strush} end
        end
    end,
}


SMODS.PokerHand {
    key = 'Lineage',
    visible = true,
    above_hand = 'Straight Flush', 
    chips = 90,
    mult = 7,
    l_chips = 20,
    l_mult = 4,
    example = {
        { 'S_Q',    true },
        { 'S_rfCAV_C',    true },
        { 'S_J',    true },
	{ 'S_rfCAV_B',    true },
	{ 'S_rfCAV_G',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Lineage',
            description = {
                '5 face cards in a row (consecutive ranks) with',
                'all cards sharing the same suit',
            }
        }
    },
    evaluate = function(parts, hand)
        if next(parts._flush) and next(parts._straight) then
            local _strush = SMODS.merge_lists(parts._flush, parts._straight)
            local lin = true
            for j = 1, #_strush do
                local rank = SMODS.Ranks[_strush[j].base.value]
                lin = lin and (rank.key == 'rfCAV_Vizier' or rank.key == 'rfCAV_Barrister' or rank.key == 'rfCAV_Cavalier' or rank.key == 'Queen' or rank.key == 'rfCAV_Pauper' or rank.key == 'King' or rank.key == 'Jack' or rank.key == 'rfCAV_Fool' or rank.key == 'rfCAV_Merchant' or rank.key == 'rfCAV_Tradesman' or rank.key == 'rfCAV_Glazier' )
            end
            if lin then return {_strush} end
        end
    end,
}





-- Royal Family Planet Card

SMODS.Atlas { key = 'Explorer', path = 'Explorer.png', px = 71, py = 95 }

SMODS.Consumable {
    set = 'Planet',
    key = 'Explorer',
    --! `h_` prefix was removed
    config = { hand_type = 'rfCAV_Royal Family', softlock = true },
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
    config = { hand_type = 'rfCAV_Lineage', softlock = true },
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
