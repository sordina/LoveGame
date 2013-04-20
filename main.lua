function love.draw()
	draw_player()
	draw_bullets()
end

function draw_player()
	love.graphics.push()
	love.graphics.translate(x, y)
	love.graphics.rotate(theta)
	love.graphics.print("Hello -=>",0,0)
	love.graphics.pop()
end

function draw_bullets()
	for k,v in pairs(bullets) do
		love.graphics.push()
		love.graphics.translate(v['x'], v['y'])
		love.graphics.rotate(v['theta'])
		love.graphics.print(v['bullet'],0,0)
		love.graphics.pop()
	end
end

function love.mousepressed(x, y, button)
	bling = love.audio.newSource("audio/music.wav")
	love.audio.play(bling)
end

function love.keypressed(key,unikey)
	if key == "escape" then
		love.event.push("quit")
	end

	if unikey == 32 then -- space
		table.insert(bullets, {x=x + math.cos(theta) * 50, y=y + math.sin(theta) * 50, theta=theta, bullet="=>"})
		love.audio.rewind(gun)
		love.audio.play(gun)
	end
end

function delta(x1,y1,x2,y2)
	dx = x1 - x2
	dy = y1 - y2
	a  = math.pow(dx,2)
	b  = math.pow(dy,2)
	return math.sqrt(a+b)
end

function love.update(dt)
	x = x + dt * speed * math.cos(theta)
	y = y + dt * speed * math.sin(theta)

	for k,v in pairs(bullets) do
		if delta(v['x'],v['y'],x,y) < 2000 then
			v['x'] = v['x'] + dt * 2 * speed * math.cos(v['theta'])
			v['y'] = v['y'] + dt * 2 * speed * math.sin(v['theta'])
		else
			table.remove(bullets,k)
		end
	end

	if love.keyboard.isDown("left") then
		theta = theta - (dtheta * dt)
	elseif love.keyboard.isDown("right") then
		theta = theta + (dtheta * dt)
	end
end

-- Initialization Functions
--
function love.load()
	init_player()
	bullets = {}
	baddies = {}
	init_background_music()
	gun = love.audio.newSource("audio/gun.wav", "static")
end

function init_player()
	x      = 200
	y      = 200
	theta  = 0
	speed  = 100
	dtheta = 3
end

function init_background_music()
	music = love.audio.newSource("audio/soundtrack01.wav")
	music:setVolume(0.5) -- 90% of ordinary volume
	music:setLooping(true)
	love.audio.play(music)
end
