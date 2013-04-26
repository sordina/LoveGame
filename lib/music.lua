
function music_change(s, level)
	if(music) then
		love.audio.stop(music)
	end
	music = love.audio.newSource(s)
	music:setVolume(0.7)
	music:setLooping(true)
	music:setPitch(level or 1)
	love.audio.play(music)
end
