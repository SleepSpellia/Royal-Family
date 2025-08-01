SMODS.Joker{ --Ecto Cooler
    name = "Ecto Cooler",
    key = "ectocooler",
    config = {
        extra = {
            hand_size = 2
        }
    },
    loc_txt = {
        ['name'] = 'Ecto Cooler',
        ['text'] = {
            [1] = 'Gives +2 hand size if hand size is below 7.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'ecto_cooler',

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if G.hand.config.card_limit <= 7 then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Busted!", colour = G.C.BLUE})
                G.hand:change_size(card.ability.extra.hand_size)
                return true
            end
                }
            end
        end
    end
}