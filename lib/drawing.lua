function love.draw()
	draw_thing(player)

	draw_things(bullets)
	draw_things(baddies)
end

-- Helpers

function draw_things(items)
	for k,v in pairs(items) do draw_thing(v) end
end

function draw_thing(thing)
	love.graphics.push()
		love.graphics.translate(thing['x'], thing['y'])
		love.graphics.rotate(thing['theta'])
		love.graphics.print(thing['display'],0,0)
	love.graphics.pop()
end
