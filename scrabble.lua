SMODS.Joker{ --Scrabble
    name = "Scrabble",
    key = "scrabble",
    config = {
        extra = {
            wordmult = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Scrabble',
        ['text'] = {
            [1] = 'Gain {X:red,C:white}X1{} Mult per {C:attention}held in hand{} card for',
            [2] = 'leaving only {C:attention}face {}or {C:attention}Aces {}in hand.'
        }
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'rf_jokers',
    pos = {x = 3, y = 3},

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if (context.other_card:get_id() == 14 or context.other_card:is_face()) then
                return {
                    func = function()
                    card.ability.extra.wordmult = (card.ability.extra.wordmult) + 1
                    return true
                end,
                    message = "Letter!"
                }
            elseif (not (context.other_card:get_id() == 14) and not (context.other_card:is_face())) then
                return {
                    func = function()
                    card.ability.extra.wordmult = 1
                    return true
                end,
                    message = "Number Left!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.wordmult
                }
        end
        if context.after and context.cardarea == G.jokers then
                return {
                    func = function()
                    card.ability.extra.var1 = 0
                    return true
                end
                }
        end
    end
}