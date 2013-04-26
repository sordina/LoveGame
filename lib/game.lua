function win()
	function love.update(dt)
		win_screen_update(dt)
	end
	function love.draw()
		win_screen_draw()
	end
end

function lose()
	function love.update(dt)
		lose_screen_update(dt)
	end
	function love.draw()
		lose_screen_draw()
	end
end

function win_screen_update(dt)
	music_change("audio/Win.wav")
	function love.update(dt)
	end
end

function lose_screen_update(dt)
	music_change("audio/Lose.wav")
	function love.update(dt)
	end
end

function win_screen_draw()
	draw_thing({
		x = 200,
		y = 200,
		theta = -0.1,
		color = random_color(),
		size = 5,
		display = "You WIN!!!!\n Score: " .. (hud['score'] + player['health'])
	})
end

function lose_screen_draw()
	draw_thing({
		x = 200,
		y = 200,
		theta = 0.1,
		color = random_color(),
		size = 5,
		display = "You Lose :(\n Score: " .. (hud['score'] + player['health'])
	})
end
