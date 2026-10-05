local utils = require("framework.utils")

local technology = {}

---Create the technology science cost. Set this as the "unit" field
---@param count uint64
---@param ingredients data.ResearchIngredient[]
---@param time number
---@return data.TechnologyUnit
technology.cost = function(count, ingredients, time)
    return {
        count = count,
        ingredients = ingredients,
        time = time
    }
end

---Create an `unlock-recipe` effect
---@param recipe string
---@return data.UnlockRecipeModifier
technology.unlock_recipe = function(recipe)
    return {
        type = "unlock-recipe",
        recipe = recipe
    }
end

---Create multiple `unlock-recipe` effects
---@param recipes string[]
---@return data.UnlockRecipeModifier[]
technology.unlock_recipes = function(recipes)
    local effects = {}

    for _, recipe in pairs(recipes) do
        table.insert(effects, technology.unlock_recipe(recipe))
    end

    return effects
end

---Add a little "black hole" icon at the bottom right of the technology icon. Keep consistency with vanilla
---@param your_black_hole_icon string
---@param icon_size integer
---@return data.IconData[]
function technology.technology_icon_black_hole(your_black_hole_icon, icon_size)
    icon_size = icon_size or 256
    local icons = util.technology_icon_constant_planet(your_black_hole_icon)
    icons[1].icon_size = icon_size
    icons[2].icon = utils.icon("black-hole-icon_64")
    -- End result is an icons object ressembling the following, as of 2.0.37. Future API changes might change this code,
    -- which is why this function is written to reference the base function instead of copying it by hand.
    -- local icons = {
    -- 	{
    -- 		icon = your_blackhole_icon,
    -- 		icon_size = icon_size,
    -- 	},
    -- 	{
    -- 		icon = "__PlanetsLib__/graphics/icons/moon-technology-symbol.png",
    -- 		icon_size = 128,
    -- 		scale = 0.5,
    -- 		shift = { 50, 50 },
    -- 		floating = true
    -- 	},
    -- }
    return icons
end

return technology
