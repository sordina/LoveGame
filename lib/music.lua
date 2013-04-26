
function music_change(s)
	if(music) then
		love.audio.stop(music)
	end
	music = love.audio.newSource(s)
	music:setVolume(0.5)
	music:setLooping(true)
	love.audio.play(music)
end
