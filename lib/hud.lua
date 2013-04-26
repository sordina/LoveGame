function draw_hud()
	love.graphics.push()
		love.graphics.setColor(50,255,50,200)
		love.graphics.print(hud_build(hud),10,10)
	love.graphics.pop()
end

function hud_build(inhud)
	return ("Score   " .. hud['score'] .. "\n" ..
	        "Health  " .. player['health'] .. "\n" ..
	        "Evil    " .. baddie_evil_count)
end

function hud_init()
	return {
		score  = 0,
		health = 100
	}
end
