SMODS.Joker{ --Jaipur
    key = "jaipur",
    config = {
        extra = {
            Merchcrick = 0,
            coupon = 0
        }
    },
    loc_txt = {
        ['name'] = 'Jaipur',
        ['text'] = {
            [1] = '{C:attention}Merchants {}left in hand after scoring are {C:red}destroyed {}once per round,',
            [2] = 'if this happens, gain a {C:enhanced}Coupon Tag {}at the end of the round.'
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
    atlas = 'jaipur',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.Merchcrick or 0) == 1 then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_coupon")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                    return true
                end,
                    message = "Created Tag!",
                    extra = {
                        func = function()
                    card.ability.extra.Merchcrick = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == rfCAV_Merchant and (card.ability.extra.Merchcrick or 0) == 0) then
                context.other_card.should_destroy = true
                return {
                    func = function()
                    card.ability.extra.Merchcrick = 1
                    return true
                end,
                    extra = {
                        message = "Traded",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}