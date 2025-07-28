local prefix = SMODS.Mods["paperback"].prefix
ranks = {}

table.insert(ranks, prefix .. '_Apostle')
SMODS.Ranks['paperback_Apostle'].straight_edge = false
SMODS.Ranks['paperback_Apostle'].next = {'rfCAV_Sun'}

