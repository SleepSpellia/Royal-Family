SMODS.Joker{ --jackofeverytrade
    name = "jackofeverytrade",
    key = "jackofeverytrade",
    config = {
        extra = {
            source_rank_type = "specific",
            source_ranks = {"J"},
            target_rank = "face_cards",
            active = 0
        }
    },
    loc_txt = {
        ['name'] = 'jackofeverytrade',
        ['text'] = {
            [1] = 'After playing a hand with a {C:attention}scoring Jack{}',
            [2] = 'and {C:attention} scoring Tradesmen{}, treat all Jacks',
            [3] = 'as any face rank and destory Tradesmen.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jackofeverytrade',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
            if (context.other_card:get_id() == Tradesmen and (card.ability.extra.active or 0) == 1) then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if (c:get_id() == 11 and (card.ability.extra.active or 0) == 1) then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == rfCAV_Tradesman then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                card.ability.extra.active = 1
                return {
                    message = "Activated!"
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
} 
      
local card_is_face_ref = Card.is_face
function Card:is_face(from_boss)
    local original_result = card_is_face_ref(self, from_boss)
    if original_result then return true end
    
    local card_id = self:get_id()
    if not card_id then return false end

    if next(SMODS.find_card("j_modprefix_jackofeverytrade")) then
        local source_ids = {11}
        for _, source_id in pairs(source_ids) do
            if card_id == source_id then return true end
        end
    end
    return false
end
