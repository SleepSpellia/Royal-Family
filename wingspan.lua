SMODS.Joker{ --Wingspan
    name = "Wingspan",
    key = "wingspan",
    config = {
        extra = {
            Uses = 8,
            perma_bonus = 3,
            perma_p_dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wingspan',
        ['text'] = {
            [1] = 'Attach {C:money}$3 {}to your first scored card for the next 8 hands.',
            [2] = '{C:inactive}(#1# uses left){}'
        }
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'rf_jokers',
    pos = {x = 4, y = 1},

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Uses, card.ability.extra.perma_p_dollars}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card == context.scoring_hand[1] then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.perma_bonus
                card.ability.extra.Uses = math.max(0, (card.ability.extra.Uses) - 1)
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
        if context.after and context.cardarea == G.jokers then
            if (card.ability.extra.Uses or 0) <= 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Bye Bye Birdie!"
                }
            end
        end
    end
}