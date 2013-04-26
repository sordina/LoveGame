function baddie_die(bad)
	hud['score'] = math.floor( hud['score'] + 1000 / (time_playing + 100) )

	if(#baddies == 0) then
		if(math.random() < 0.5) then
			table.insert(baddies,random_baddie(5, 'BOSS>'))
		else
			win()
		end
	end
end

function baddies_update_all(dt)
	for k,v in pairs(baddies) do
		baddies_update_single(v,dt)
	end
end

function baddies_update_single(baddie,dt)
	local delx  = baddie['x'] - player['x']
	local dely  = baddie['y'] - player['y']

	local dth = baddie['theta'] - math.atan2( dely, delx )
	if dth ~= dth then dth = 0 end -- Test for NaN

	local adjustment = 0.01 * math.sin( dth )
	local randomness = math.random() * 0.02 - 0.01

	baddie['theta'] = baddie['theta'] + adjustment + randomness
end

function random_baddie(size,display)
	return {
		speed   = 83,
		size    = size or (0.8 + math.random() * 0.4),
		color   = {red = 255, green = 50, blue = 50, alpha = 254},
		theta   = 0,
		x       = 130,
		y       = 100 + 600 * math.random(),
		display = display or "BAD-GUY>"
	}
end

function baddies_random_set()
	return { random_baddie(),
	         random_baddie(),
	         random_baddie()
	}
end
