require("lib/drawing")
require("lib/input")
require("lib/utils")
require("lib/init")
require("lib/baddies")
require("lib/collision")

function love.update(dt)
	move_thing(player, dt)
	move_things(bullets, dt)
	move_things(baddies, dt)

	filter_bullets()
	baddies_update_all(dt)
	collisions_update_all()

	if love.keyboard.isDown("left") then
		rotate_thing(player, 0 - (dtheta * dt))
	elseif love.keyboard.isDown("right") then
		rotate_thing(player,     (dtheta * dt))
	end
end

function move_things(items, dt)
	for k,v in pairs(items) do
		move_thing(v, dt)
	end
end

function filter_bullets()
	for k,v in pairs(bullets) do
		if delta_thing(v,player) > 2000 then
			table.remove(bullets,k)
		end
	end
end

function rotate_thing(thing, angle)
	thing['theta'] = thing['theta'] + angle
end

function move_thing(thing, dt)
	thing['x'] = thing['x'] + dt * thing['speed'] * math.cos(thing['theta'])
	thing['y'] = thing['y'] + dt * thing['speed'] * math.sin(thing['theta'])
end
