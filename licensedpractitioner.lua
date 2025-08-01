SMODS.Joker{ --Licensed Practitioner 
    key = "licensedpractitioner",
    config = {
        extra = {
            repetitions = 1,
            repetitions2 = 1,
            repetitions3 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Licensed Practitioner ',
        ['text'] = {
            [1] = '{C:attention}Tradesmen {}and {C:attention}Glaziers {}retrigger their {C:enhanced}seal {}effects.'
        }
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'rf_jokers',
    pos = {x = 2, y = 0},

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if ((context.other_card:get_id() == 11 and context.other_card.seal ~= nil) or (context.other_card:get_id() == 13 and context.other_card.seal ~= nil)) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            if ((context.other_card:get_id() == 11 and context.other_card.seal ~= nil) and (context.other_card:get_id() == 13 and context.other_card.seal ~= nil)) then
                return {
                    repetitions = card.ability.extra.repetitions2,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.repetition and context.cardarea == G.play then
            if (((function()
    local rankFound = false
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 11 then
            rankFound = true
            break
        end
    end
    
    return rankFound
end)() and context.other_card.seal ~= nil) and ((function()
    local rankFound = false
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 13 then
            rankFound = true
            break
        end
    end
    
    return rankFound
end)() and context.other_card.seal ~= nil)) then
                return {
                    repetitions = card.ability.extra.repetitions3,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}