SMODS.Joker{ --Ark Nova
    key = "arknova",
    config = {
        extra = {
            dollars = 6
        }
    },
    loc_txt = {
        ['name'] = 'Ark Nova',
        ['text'] = {
            [1] = 'When you add new #1# cards into your deck, gain {C:money}$6{}.',
            [2] = '{C:inactive}(Card suit changes each round){}'
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
    atlas = 'Arknova',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.addsuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.addsuit_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.addsuit_card = { suit = 'Spades' }
    end,

    calculate = function(self, card, context)
        if context.playing_card_added and card.is_suit(addsuit)  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                if G.playing_cards then
                    local valid_addsuit_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_addsuit_cards[#valid_addsuit_cards + 1] = v
                        end
                    end
                    if valid_addsuit_cards[1] then
                        local addsuit_card = pseudorandom_element(valid_addsuit_cards, pseudoseed('addsuit' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.addsuit_card.suit = addsuit_card.base.suit
                    end
                end
        end
    end
}