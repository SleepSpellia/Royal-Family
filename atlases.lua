local card = {px = 71, py = 95}

function create_atlas(key, path, px, py)
	if not (px and py) then
		print("MADCAP - Atlas "..key.." not working!")
	end
	return { 
		object_type = "Atlas",
		key=key,
		path=path,
		px=px or 71,
		py=py or 95
	}
end

-- Card atlas
function create_card_atlas(key, path)
	return create_atlas(key, path, card.px, card.py)
end

-- Animated atlas
function create_anim_atlas(key, path, frms, px, py)
	local atlas = create_atlas(key, path, px, py)
	atlas["frames"] = frms or 21
	return atlas
end

-- Square Atlas
function create_square_atlas(key, path, size)
	return create_atlas(key, path, size, size)
end

-- 34x34 atlas
function create_blind_atlas(key, path, size, frms)
	return {
		object_type = "Atlas",
		key = key,
		atlas_table = "ANIMATION_ATLAS",
		path = path,
		px = size or 34,
		py = size or 34,
		frames = frms or 21
	}
end

local atlases = {
	-- create_card_atlas('placeholder', 'placeholder.png'),
	-- create_card_atlas('jokers', 'jokers.png'),
	-- create_card_atlas('jokers_legendary', 'jokers_legendary.png'),
	-- custom ranks, base suits
	create_card_atlas('RF_Cards', 'RF_Cards'),
	create_card_atlas('RF_Cards_hc', 'RF_Cards_hc.png'),
	-- custom suits, base ranks
	create_card_atlas('Pioneer', 'Pioneer.png'),
	create_card_atlas('Explorer', 'Explorer.png'),
	create_card_atlas('Face Deck', 'Face Deck.png'),
}

return {
    name = "Atlases",
    init = function() print("Atlases!") end,
    items = atlases
}