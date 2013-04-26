baddie_evil_count = 0

function baddie_die(bad)
	if string.find(bad.display, "E") then
		if baddie_evil_count > 0 then
			baddie_evil_count = baddie_evil_count - 1
		end
		if baddie_evil_count < 1 then
			music_change("audio/soundtrack01.wav")
		end
	end

	hud['score'] = math.floor( hud['score'] + 1000 / (time_playing + 100) )

	if(math.random() < 0.12) then
		local ecol = {red = 12, green = 255, blue = 48, alpha = 255}
		table.insert(baddies,random_baddie(2, 'EVIL>', ecol))
		table.insert(baddies,random_baddie(3, 'EVIL>>', ecol))
		baddie_evil_count = baddie_evil_count + 2
		music_change("audio/evil.wav", 1 + (0.1 * (baddie_evil_count - 2)))
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
	-- Where they think you will be
	local delx = baddie['x'] - player['x'] - math.random() * 2 * math.cos(player.theta)
	local dely = baddie['y'] - player['y'] - math.random() * 2 * math.sin(player.theta)

	local dth = baddie['theta'] - math.atan2( dely, delx )
	if dth ~= dth then dth = 0 end -- Test for NaN

	local adjustment = 0.02 * math.sin( dth )
	local randomness = math.random() * 0.02 - 0.01

	baddie['theta'] = baddie['theta'] + adjustment + randomness
end

function random_baddie(size,display,color)
	return {
		speed   = 83 + 100 * math.random(),
		size    = size or (0.8 + math.random() * 0.4),
		color   = color or {red = 255, green = 50, blue = 50, alpha = 254},
		theta   = math.pi * 2 * math.random(),
		x       = 1000 * math.random(),
		y       = 1000 * math.random(),
		display = display or "BAD-GUY>"
	}
end

local next_step = 0

function baddies_add()
	if time_playing < 22 and (time_playing * 2 + next_step) > #baddies then
		next_step = 2 * math.random()

		local bad = random_baddie()
		table.insert(baddies, bad)

		local displays     = {"NICE", "YEAH!", "AWESOME!!!", "Totally Sweet BRO"}
		local display_word = displays[1 + math.floor(math.random() * 4)]

		for unused = 0, 20, 1 do
			spawn_explosion(bad, display_word)
		end

		love.audio.rewind(audio_bling)
		audio_bling:setPitch(1 + math.random() * 0.2)
		love.audio.play(audio_bling)
	end
end


function spawn_explosion(bad, display_word)
	local r = math.random() / 2

	local x = bad['x']
	local y = bad['y']

	table.insert(explosions, {
		x       = x,
		y       = y,
		color   = {red = 0, green = 0, blue = 0, alpha = 98},
		center  = {x = x, y = y},
		size    = 1 + r,
		theta   = math.random() * math.pi * 2,
		display = display_word,
		speed   = 50 + r * 100
	})
end
