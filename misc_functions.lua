---Gets the number of unique suits in a provided scoring hand - From Paperback
---@param scoring_hand table
---@param bypass_debuff boolean?
---@param flush_calc boolean?
---@return integer
function rfCAV_UTIL.get_unique_suits(scoring_hand, bypass_debuff, flush_calc)
  -- Set each suit's count to 0
  local suits = {}

  for k, _ in pairs(SMODS.Suits) do
    suits[k] = 0
  end

  -- First we cover all the non Wild Cards in the hand
  for _, card in ipairs(scoring_hand) do
    if not SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

  -- Then we cover Wild Cards, filling the missing suits
  for _, card in ipairs(scoring_hand) do
    if SMODS.has_any_suit(card) then
      for suit, count in pairs(suits) do
        if card:is_suit(suit, bypass_debuff, flush_calc) and count == 0 then
          suits[suit] = count + 1
          break
        end
      end
    end
  end

--- Checks whether a given card is a certain rank
---@param card Card | table
---@param rank string | integer a rank's name, like "Jack" or "4", or an id like 11 or 4
---@return boolean | nil
function rfCAV_UTIL.is_rank(card, rank)
  if not card or not card.get_id then return end
  local id = card:get_id()

  if type(rank) == 'string' then
    local rank_obj = SMODS.Ranks[rank]
    return rank_obj and rank_obj.id == id
  elseif type(rank) == 'number' then
    return id == rank
  end
end

---Gets a rank's object from a supplied id
---@param id integer
---@return table | nil
function rfCAV_UTIL.get_rank_from_id(id)
  for _, v in pairs(SMODS.Ranks) do
    if v.id == id then return v end
  end
end

---Returns whether the first rank is higher than the second
---@param rank1 string | integer a rank such as "Ace" or "9", or an id such as 14 or 9
---@param rank2 string | integer
---@param allow_equal? boolean
---@return boolean
function rfCAV_UTIL.compare_ranks(rank1, rank2, allow_equal)
  local r1 = type(rank1) == 'string' and SMODS.Ranks[rank1] or rfCAV_UTIL.get_rank_from_id(rank1)
  local r2 = type(rank2) == 'string' and SMODS.Ranks[rank2] or rfCAV_UTIL.get_rank_from_id(rank2)

  -- If one of the ranks doesn't exist
  if not r1 or not r2 then return false end

  local comp = function(a, b)
    return allow_equal and (a >= b) or (a > b)
  end

  return comp(r1.sort_nominal, r2.sort_nominal)
end



