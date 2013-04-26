local cls = { random_color(33), random_color(33), random_color(33), random_color(33), random_color(33), random_color(33) }

function draw_background(level,px,py)
	if not level then
		level = 5
		px    = 400
		py    = 400
	end

	local c = cls[level + 1]

	local cx = {
		x = px + 10 * (level + 1) * math.sin(love.timer.getTime()/(level + 1)),
		y = py + 10 * (level + 1) * math.cos(love.timer.getTime()/(level + 1))}

	love.graphics.push()
		love.graphics.setColor(
			c.red, c.green, c.blue,
			c.alpha / (baddie_evil_count + 1)
			)
		love.graphics.circle( "fill", cx.x, cx.y, level * 100, 35 )
	love.graphics.pop()

	if level > 0 then
		draw_background(level - 1, cx.x, cx.y)
	end
end
