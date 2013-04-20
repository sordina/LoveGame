function love.draw()
	love.graphics.translate(x, y)
	love.graphics.push()
	love.graphics.rotate(theta)
	love.graphics.print("Hello -=>" .. bullets,0,0)
	love.graphics.pop()
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
		bullets = "=>" .. bullets
		bling = love.audio.newSource("audio/gun.wav")
		love.audio.play(bling)
	end
end

function love.update(dt)
	x = x + dt * speed * math.cos(theta)
	y = y + dt * speed * math.sin(theta)

	if math.random() > 0.9 then
		bullets = " " .. bullets
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
	init_bullets()
	background_music()
end

function init_bullets()
	bullets = ""
end

function init_player()
	x      = 200
	y      = 200
	theta  = 0
	speed  = 100
	dtheta = 3
end

function background_music()
	music = love.audio.newSource("audio/soundtrack01.wav")
	music:setVolume(0.5) -- 90% of ordinary volume
	music:setLooping(true)
	love.audio.play(music)
end
