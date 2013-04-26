function baddie_die(bad)
	hud['score'] = math.floor( hud['score'] + 1000 / (time_playing + 100) )

	if(math.random() < 0.02) then
		local ecol = {red = 12, green = 255, blue = 48, alpha = 255}
		table.insert(baddies,random_baddie(2, 'EVIL1:>', ecol))
		table.insert(baddies,random_baddie(2, 'EVIL2:>', ecol))
		music_change("audio/evil.wav")
	end

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

function random_baddie(size,display,color)
	return {
		speed   = 83,
		size    = size or (0.8 + math.random() * 0.4),
		color   = color or {red = 255, green = 50, blue = 50, alpha = 254},
		theta   = math.pi * 2 * math.random(),
		x       = 1000 * math.random(),
		y       = 1000 * math.random(),
		display = display or "BAD-GUY>"
	}
end

function baddies_random_set()
	return { random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie(), random_baddie(), random_baddie(), random_baddie(), random_baddie(),
	         random_baddie()
	}
end
