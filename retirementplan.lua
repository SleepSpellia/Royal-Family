SMODS.Joker{ --Retirement Plan
    name = "Retirement Plan",
    key = "retirementplan",
    config = {
        extra = {
            investment = 0
        }
    },
    loc_txt = {
        ['name'] = 'Retirement Plan',
        ['text'] = {
            [1] = '{C:red}Discarding{} exactly a single {C:green}Tradesman {}gives an',
            [2] = '{C:attention}Investment Tag{}, then destroys this joker.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'rf_jokers',
    pos = {x = 1, y = 0},

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == rfCAV_Tradesman then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 1
end)() and #context.full_hand == 1) then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_investment")
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
                card:start_dissolve()
                return true
            end,
                            message = "And one day away too...",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}