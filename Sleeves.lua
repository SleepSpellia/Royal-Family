CardSleeves.Sleeve {
    key = "Familial_Sleeve",
    atlas = "sleeves_Face",  -- you will need to create an atlas yourself
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = "Familial Sleeve",
        text = { "Only face cards in the initial deck" }
    },
  unlocked = true,
  unlock_condition = { deck = "rfCAV_Face_Deck", stake = "stake_white" },
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
}
