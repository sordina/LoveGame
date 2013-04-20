function delta_thing(t1,t2)
	dx = t1['x'] - t2['x']
	dy = t1['y'] - t2['y']
	a  = math.pow(dx,2)
	b  = math.pow(dy,2)
	return math.sqrt(a+b)
end
