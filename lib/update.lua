
function love.update(dt)

	time_playing = time_playing + dt

	move_thing(player,      dt)

	move_things(bullets,    dt)
	move_things(baddies,    dt)
	move_things(explosions, dt)

	filter_bullets()
	filter_explosions()
	baddies_update_all(dt)
	collisions_update_all()

	if love.keyboard.isDown("left") then
		rotate_thing(player, 0 - (dtheta * dt))
	elseif love.keyboard.isDown("right") then
		rotate_thing(player,     (dtheta * dt))
	end
end

function filter_bullets()
	for k,v in pairs(explosions) do
		if delta_thing(v,v['center']) > 100 then
			table.remove(explosions,k)
		end
	end
end

function filter_explosions()
	for k,v in pairs(bullets) do
		if delta_thing(v,player) > 2000 then
			table.remove(bullets,k)
		end
	end
end

function rotate_thing(thing, angle)
	thing['theta'] = thing['theta'] + angle
end

function move_things(items, dt)
	for k,v in pairs(items) do
		move_thing(v, dt)
	end
end

function move_thing(thing, dt)
	local r = thing.random or 0
	thing['x'] = thing['x'] + dt * thing['speed'] * math.cos(thing['theta']) + r * (math.random() - 0.5)
	thing['y'] = thing['y'] + dt * thing['speed'] * math.sin(thing['theta']) + r * (math.random() - 0.5)
end
