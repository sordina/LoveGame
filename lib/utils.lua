function delta_thing(t1,t2)
	dx = t1['x'] - t2['x']
	dy = t1['y'] - t2['y']
	a  = math.pow(dx,2)
	b  = math.pow(dy,2)
	return math.sqrt(a+b)
end

function random_color(alpha)
	return {
		red   = math.random() * 255,
		green = math.random() * 255,
		blue  = math.random() * 255,
		alpha = alpha or (math.random() * 255)
	}
end
