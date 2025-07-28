SMODS.Joker{ --Who is the fairest of them all
    name = "Who is the fairest of them all",
    key = "whoisthefairestofthemall",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Who is the fairest of them all',
        ['text'] = {
            [1] = 'If {C:attention}played hand{} contains at least one scored {C:attention} Queen{} and {C:attention} Glazier{},',
            [2] = 'create a new {C:attention}Glass{} Queen, added to the deck.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'whosthefairest',

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 12 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == rfCAV_Glazier then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                local card_front = pseudorandom_element({G.P_CARDS.S_Q, G.P_CARDS.H_Q, G.P_CARDS.D_Q, G.P_CARDS.C_Q}, pseudoseed('add_card_suit'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_glass
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Added Card!"
                }
            end
        end
    end
}