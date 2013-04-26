
function init_player()
	player = {
		x       = 200,
		y       = 200,
		health  = 100,
		color   = {red = 255, green = 255, blue = 255, alpha = 255},
		theta   = 0,
		speed   = 100,
		size    = 2,
		display = "Player->"
	}
end

function player_recenter()
	local sw = love.graphics.getWidth()
	local sh = love.graphics.getHeight()
	if player.x < 0 or player.y < 0 or player.x > sw or player.y > sh then
		player.x = sw / 2
		player.y = sh / 2
	end
end

function player_hit(bad)
	player['health'] = player['health'] - 1
	love.audio.rewind(player_impact)
	player_impact:setPitch(1 + math.random() * 0.2)
	love.audio.play(player_impact)

	local x = player.x
	local y = player.y
	local r = math.random()

	table.insert(explosions, {
		x       = x,
		y       = y,
		color   = {red = 15, green = 14, blue = 255, alpha = 244},
		center  = {x = x, y = y},
		size    = 1 - r,
		theta   = math.random() * math.pi * 2,
		display = "): OUCH :(",
		speed   = 30 + r * 40
	})


	if(player['health'] < 0) then
		lose()
	end
end
