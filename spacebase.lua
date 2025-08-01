SMODS.Joker{ --Space Base
    key = "spacebase",
    config = {
        extra = {
            randomendamt = 0,
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Space Base',
        ['text'] = {
            [1] = 'Earn $10 if you end a round with {C:money}$#1# {}',
            [2] = '{C:inactive} (Amount changes each round from 1-12){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Spacebase',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.randomendamt}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.GAME.dollars == to_big(card.ability.extra.randomendamt) then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        func = function()
                    card.ability.extra.randomendamt = pseudorandom('randomendamt_5a5b0bdf', 1, 12)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}