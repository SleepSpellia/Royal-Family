local get_pos = function(_y,_x)
    return { x=_x, y=_y }
end

--[[
    PALE DECK:
    - Apply Negative edition to 1/4 of total playing cards
        (prioritie base edition cards)
    - Decrease starting hand size by 2.
    - Decrease hands by 1
    - The Force is guaranteed to appear once every 8 antes
    - Midnight Void is guaranteed as first Showdown Blind,
        and has a 1 in 3 chance to reappear after Ante 8
]]

local Face Deck = {
	object_type = "Back",
    key = "Face Deck",
    atlas = 'Face Deck',
    pos = get_pos(0,0),
    config = {
        starting_suits = {
            'Hearts',
            'Spades',
            'Diamonds',
            'Clubs',
        },
        starting_ranks = { 'F', 'P', 'Tr', 'M', 'G', 'B','Jack', 'C', 'Queen', 'V', 'King', 'Ace', 'S', 'U'}
    },
    loc_vars = function(self)
        return { vars = { }}
    end,
    apply = function(self)
        tell('Face Deck applied!')

        
    end
}




function RGMC.funcs.less_than(a,b,equals)
    if equals then
        return to_big(a) <= to_big(b)
    else
        return to_big(a) < to_big(b)
    end
end

function RGMC.funcs.greater_than(a,b,equals)
    if equals then
        return to_big(a) >= to_big(b)
    else
        return to_big(a) > to_big(b)
    end
end

function RGMC.funcs.create_target_deck_reward(list,id)
    local boosty = list[math.random(1, #list)]

    local t = Tag(id, nil)
    add_tag(t)

    G.GAME.tags[#G.GAME.tags].config.extra.booster_type = boosty
end

local list = {}

local decks = {
    Face Deck,
}

for i=1, #decks do
    list[i] = decks[i]
end

for i=1, #list do
    if list[i] then list[i].order = i-1 end
end

return {
    name = "Decks",
    init = function() print("Decks!") end,
    items = decks
}