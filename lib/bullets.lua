function bullet_explode(bul)
	love.audio.rewind(audio_explosion)
	audio_explosion:setPitch(1 + math.random() * 0.2)
	love.audio.play(audio_explosion)

	for unused = 0, 10, 1 do
		bullet_explode_part(bul)
	end
end

function bullet_explode_part(bul)
	local r = math.random()

	local x = bul['x']
	local y = bul['y']

	table.insert(explosions, {
		x       = x,
		y       = y,
		color   = random_color(),
		center  = {x = x, y = y},
		size    = 1 + r,
		theta   = math.random() * math.pi * 2,
		display = "!!!BOOM!!!",
		random  = 2,
		speed   = 30 + r * 40
	})
end
