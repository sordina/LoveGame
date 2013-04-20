function love.draw()
	draw_player()
	draw_bullets()
	draw_baddies()
end

function draw_baddies()
end

function random_baddie()
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
