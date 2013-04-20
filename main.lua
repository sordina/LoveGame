function love.draw()
	love.graphics.translate(x, y)
	love.graphics.push()
	love.graphics.rotate(theta)
	love.graphics.print("Hello World",0,0)
	love.graphics.pop()
end

function love.mousepressed(x, y, button)
	bling = love.audio.newSource("music.wav")
	love.audio.play(bling)
end

function love.update(dt)
	x = x + dt * speed * math.cos(theta)
	y = y + dt * speed * math.sin(theta)

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
	background_music()
end

function init_player()
	x      = 200
	y      = 200
	theta  = 0
	speed  = 100
	dtheta = 3
end

function background_music()
	music = love.audio.newSource("soundtrack01.wav")
	music:setVolume(0.5) -- 90% of ordinary volume
	music:setLooping(true)
	love.audio.play(music)
end
