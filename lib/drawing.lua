function love.draw()
	draw_player()
	draw_bullets()
	draw_baddies()
end

function draw_baddies()
end

function random_baddie()
end

function draw_player()
	draw_thing(player)
end

function draw_bullets()
	for k,v in pairs(bullets) do draw_thing(v) end
end

function draw_thing(thing)
	love.graphics.push()
		love.graphics.translate(thing['x'], thing['y'])
		love.graphics.rotate(thing['theta'])
		love.graphics.print(thing['display'],0,0)
	love.graphics.pop()
end
