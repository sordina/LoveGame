
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

function player_hit(bad)
	player['health'] = player['health'] - 1
	love.audio.rewind(player_impact)
	player_impact:setPitch(1 + math.random() * 0.2)
	love.audio.play(player_impact)

	if(player['health'] < 0) then
		lose()
	end
end
