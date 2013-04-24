function baddies_update_all(dt)
	for k,v in pairs(baddies) do
		baddies_update_single(v,dt)
	end
end

function baddies_update_single(baddie,dt)
	local delx  = baddie['x'] - player['x']
	local dely  = baddie['y'] - player['y']

	local dth = baddie['theta'] - math.atan2( dely, delx )
	if dth ~= dth then dth = 0 end -- Test for NaN

	local adjustment = 0.01 * math.sin( dth )
	-- local randomness = math.random() * 0.2 - 0.1

	baddie['theta'] = baddie['theta'] + adjustment -- randomness + adjustment
end

function random_baddie()
	return {
		speed   = 83,
		theta   = 0,
		x       = 130,
		y       = 100 + 600 * math.random(),
		display = "BAD-GUY>"
	}
end

function baddies_random_set()
	return { random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie(),
	         random_baddie()
	}
end
