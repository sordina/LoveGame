function collisions_update_all()
	for i1,bad in pairs(baddies) do
		if(delta_thing(player,bad) < 10) then
			player_hit(bad)
		end

		for i2,bul in pairs(bullets) do
			if(delta_thing(bul,bad) < 10) then
				table.remove(baddies,i1)
				table.remove(bullets,i2)
				bullet_explode(bul)
				baddie_die(bad)
			end
		end
	end
end
