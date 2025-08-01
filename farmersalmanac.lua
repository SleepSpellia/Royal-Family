SMODS.Joker{ --Farmers Almanac
    key = "farmersalmanac",
    config = {
        extra = {
            farmers_held = 0,
            waiter = 0,
            giver = 0,
            scale = 1,
            rotation = 1,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'Farmers Almanac',
        ['text'] = {
            [1] = 'Paupers held in hand will give x2 each',
            [2] = 'the next hand played that round',
            [3] = '(Currently {X:mult,C:white}X #1# {})'
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
    atlas = 'FarmersAlmanac',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.farmers_held}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == rfCAV_Pauper then
                return {
                    func = function()
                    card.ability.extra.farmers_held = (card.ability.extra.farmers_held) + 2
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.waiter = 1
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (G.GAME.current_round.hands_left == 1 and (card.ability.extra.giver or 0) == 1) then
                local farmers_held_value = card.ability.extra.farmers_held
                card.ability.extra.farmers_held = 0
                card.ability.extra.waiter = 0
                card.ability.extra.giver = 0
                return {
                    Xmult = farmers_held_value,
                    extra = {
                        message = "Reset!",
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (card.ability.extra.waiter or 0) == 1 then
                local target_card = context.other_card
                return {
                    func = function()
                    card.ability.extra.giver = 1
                    return true
                end,
                    message = "Active!",
                    extra = {
                        func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                        colour = G.C.WHITE
                        }
                }
            end
        end
    end
}