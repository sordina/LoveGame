function love.draw()
	draw_hud()

	draw_things(explosions)
	draw_things(bullets)
	draw_things(baddies)

	draw_thing(player)
end

-- Helpers

function draw_things(items)
	for k,v in pairs(items) do draw_thing(v) end
end

function draw_thing(thing)
	local c = thing['color']

	love.graphics.push()
		love.graphics.setColor(c['red'], c['green'], c['blue'], c['alpha'])
		love.graphics.translate(thing['x'], thing['y'])
		love.graphics.rotate(thing['theta'])
		love.graphics.scale(thing['size'], thing['size'])
		love.graphics.print(thing['display'],0,0)
	love.graphics.pop()
end
