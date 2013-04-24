function love.mousepressed(x, y, button)
	local bling = love.audio.newSource("audio/music.wav")
	love.audio.play(bling)
end

function love.keypressed(key,unikey)
	if key == "escape" or key == "q" then
		love.event.push("quit")
	end

	if unikey == 32 then -- space
		local theta = player['theta']
		local x     = player['x']
		local y     = player['y']
		local r     = math.random()

		table.insert(bullets, {x=x + math.cos(theta) * 50, y=y + math.sin(theta) *
			50, size = 1 - 0.2 * r, theta=theta, display="PIW!!>", speed=100 + r * 200})

		love.audio.rewind(gun)
		gun:setPitch(1 + r * 0.2)
		love.audio.play(gun)
	end
end
