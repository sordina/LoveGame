function collisions_update_all()
	for i1,bul in pairs(baddies) do
		for i2,bad in pairs(bullets) do
			if(delta_thing(bul,bad) < 10) then
				table.remove(baddies,i1)
			end
		end
	end
end
