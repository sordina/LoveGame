function love.load()
	init_player()
	bullets = {}
	baddies = baddies_random_set()
	init_background_music()
	gun = love.audio.newSource("audio/gun.wav", "static")

	-- Simple Globals
	dtheta = 3
end

function init_player()
	player = {
		x       = 200,
		y       = 200,
		theta   = 0,
		speed   = 100,
		size    = 2,
		display = "Player->"
	}
end

function init_background_music()
	music = love.audio.newSource("audio/soundtrack01.wav")
	music:setVolume(0.5) -- 90% of ordinary volume
	music:setLooping(true)
	love.audio.play(music)
end
