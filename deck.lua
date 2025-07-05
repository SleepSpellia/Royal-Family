SMODS.Back {
    key = "Face_Deck",
    atlas = "Face Deck",
    pos = { x = 0, y = 0},
    unlocked = true,
    loc_txt = {
        name ="Familial Deck",
        text={
            "Start with a Deck",
            "full of {C:attention}only Face Cards{}",
        },
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if SMODS.Ranks[v.base.value].key == '2' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Fool'))
                    end
                    if SMODS.Ranks[v.base.value].key == '3' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Pauper'))
                    end
                    if SMODS.Ranks[v.base.value].key == '4' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Tradesman'))
                    end
                    if SMODS.Ranks[v.base.value].key == '5' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Merchant'))
                    end
                    if SMODS.Ranks[v.base.value].key == '6' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Glazier'))
                    end
                    if SMODS.Ranks[v.base.value].key == '7' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Barrister'))
                    end
                    if SMODS.Ranks[v.base.value].key == '8' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Un'))
                    end
                    if SMODS.Ranks[v.base.value].key == '9' then
                        assert(SMODS.change_base(v, nil,'rfCAV_Sun'))
                    end
                    --if SMODS.Ranks[v.base.value].key == '10' then
                     --   assert(SMODS.change_base(v, nil,'rfCAV_Cavalier'))
                   -- end
                   -- if SMODS.Ranks[v.base.value].key == 'Ace' then
		--	assert(SMODS.change_base(v, nil,'rfCAV_Vizier'))
                  --  end
                end
                return true
            end
        }))
    end,
    locked_loc_vars = function(self, info_queue, back)
        local other_name = localize('k_unknown')
        if G.P_CENTERS['b_black'].unlocked then
            other_name = localize { type = 'name_text', set = 'Back', key = 'b_black' }
        end

        return { vars = { other_name } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 1
    end
}
