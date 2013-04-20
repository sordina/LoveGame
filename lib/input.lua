function love.mousepressed(x, y, button)
	bling = love.audio.newSource("audio/music.wav")
	love.audio.play(bling)
end

function love.keypressed(key,unikey)
	if key == "escape" or key == "q" then
		love.event.push("quit")
	end

	if unikey == 32 then -- space
		theta = player['theta']
		x     = player['x']
		y     = player['y']
		table.insert(bullets, {x=x + math.cos(theta) * 50, y=y + math.sin(theta) *
			50, theta=theta, display="=>", speed=100 + math.random() * 200})
		love.audio.rewind(gun)
		love.audio.play(gun)
	end
end
