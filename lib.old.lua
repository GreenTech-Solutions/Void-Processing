-- Needs removing

require("scripts.ordering")
local orders = require("orders")

local Public = {
	globals = require("globals.mod")
}

function Public.merge(old, new)
	old = util.table.deepcopy(old)

	for k, v in pairs(new) do
		if v == "nil" then
			old[k] = nil
		else
			old[k] = v
		end
	end

	return old
end

Public.find = function(tbl, f, ...)
	if type(f) == "function" then
		for k, v in pairs(tbl) do
			if f(v, k, ...) then
				return v, k
			end
		end
	else
		for k, v in pairs(tbl) do
			if v == f then
				return v, k
			end
		end
	end
	return nil
end

Public.icon = function(name) return ('__VoidProcessing-Updated__/graphics/icons/%s.png'):format(name) end
Public.icon_fluid = function(name) return ('__VoidProcessing-Updated__/graphics/icons/fluid/%s.png'):format(name) end

Public.add_recipe_category = function(base_entity, new_categories)
	data.raw["assembling-machine"][base_entity].crafting_categories = Public.merge(
		data.raw["assembling-machine"][base_entity].crafting_categories,
		new_categories
	)
end

Public.order = function(name) return get_ordering(orders, name) end

---Return the weight of an item from its rocket stack size,
---assuming the rocket capacity is 1 ton
---@param count number
---@return number
Public.rocket_stack_size = function(count)
	return 1000000 / count
end

return Public
