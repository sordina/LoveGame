function love.load()

	init_player()

	time_playing = 0
	bullets      = {}
	explosions   = {}
	baddies      = {}
	hud          = hud_init()

	init_background_music()
	gun             = love.audio.newSource("audio/gun.wav",       "static")
	player_impact   = love.audio.newSource("audio/impact.wav",    "static")
	audio_explosion = love.audio.newSource("audio/explosion.wav", "static")
	audio_bling     = love.audio.newSource("audio/music.wav",     "static")

	-- Simple Globals
	dtheta = 3
end

function init_background_music()
	music_change("audio/soundtrack01.wav")
end
