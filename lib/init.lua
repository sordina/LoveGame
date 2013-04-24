function love.load()

	init_player()

	time_playing = 0
	bullets      = {}
	explosions   = {}
	baddies      = baddies_random_set()
	hud          = hud_init()

	init_background_music()
	gun             = love.audio.newSource("audio/gun.wav",       "static")
	audio_explosion = love.audio.newSource("audio/explosion.wav", "static")

	-- Simple Globals
	dtheta = 3
end

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

function init_background_music()
	music = love.audio.newSource("audio/soundtrack01.wav")
	music:setVolume(0.5)
	music:setLooping(true)
	love.audio.play(music)
end
