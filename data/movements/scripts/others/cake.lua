function onAddItem(moveitem, tileitem, position)
	-- has to be a candle
	if moveitem.itemid ~= 2048 then
		return true
	end

	moveitem:remove()
	tileitem:transform(6280)
	position:sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end
