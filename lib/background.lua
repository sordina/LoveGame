local c = random_color(33)
local d = random_color(33)
local e = random_color(33)
local f = random_color(33)

function draw_background()
	local cx = {x = 400  + 100 * math.sin(love.timer.getTime()/4),  y =  400  + 100 * math.cos(love.timer.getTime()/5)}
	local cy = {x = cx.x + 25  * math.sin(love.timer.getTime()/11), y =  cx.y + 25  * math.cos(love.timer.getTime()/12)}
	local cz = {x = cy.x + 25  * math.sin(love.timer.getTime()/21), y =  cy.y + 25  * math.cos(love.timer.getTime()/22)}

	love.graphics.push()
		love.graphics.setColor(c.red, c.green, c.blue, c.alpha)
		love.graphics.circle( "fill", cx.x, cx.y, 400, 35 )
	love.graphics.pop()

	love.graphics.push()
		love.graphics.setColor(d.red, d.green, d.blue, c.alpha)
		love.graphics.circle( "fill", cy.x, cy.y, 200, 35 )
	love.graphics.pop()

	love.graphics.push()
		love.graphics.setColor(e.red, e.green, e.blue, c.alpha)
		love.graphics.circle( "fill", cz.x, cz.y, 100, 35 )
	love.graphics.pop()
end
