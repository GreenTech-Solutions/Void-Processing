local gloabals = require("globals.mod")

local utils = {}

---Merge two tables together
---@generic T: table
---@param old T
---@generic U: table
---@param new U
---@return T | U
function utils.merge_tables(old, new)
    -- Deepcopy to prevent reference shenanigans
    old = table.deepcopy(old)
    new = table.deepcopy(new)

    for k, v in pairs(new) do
        if v == "nil" then
            old[k] = nil
        else
            old[k] = v
        end
    end

    return old
end

---Merge two arrays together
---@generic T
---@param old T[]
---@generic U
---@param new U[]
---@return (T | U)[]
function utils.merge_arrays(old, new)
    -- Deepcopy to prevent reference shenanigans
    old = table.deepcopy(old)
    new = table.deepcopy(new)

    for _, v in pairs(new) do
        table.insert(old, v)
    end

    return old
end

---Return the localized name of an item, with item/entity locale fallbacks
---@param prototype data.ItemPrototype
---@return data.LocalisedString
function utils.item_localised_name(prototype)
    return prototype.localised_name or {
        "?",
        { "item-name." .. prototype.name },
        { "entity-name." .. prototype.name },
        prototype.name,
    }
end

---Return a copy of an item's icon layers with a resolved icon size
---@param prototype data.ItemPrototype
---@return data.IconData[]
function utils.icons_of(prototype)
    if prototype.icons then
        -- In an icons array every layer has its own icon_size, 64 by default; prototype.icon_size is not used there.
        local icons = table.deepcopy(prototype.icons)
        for _, icon in pairs(icons) do
            icon.icon_size = icon.icon_size or 64
        end
        return icons
    end

    return {
        {
            icon = prototype.icon or error("Item prototype has no icon"),
            icon_size = prototype.icon_size or 64,
        },
    }
end

---Add icon layers in the upper-right corner of a base icon, at half its size
---@param base_icons data.IconData[]
---@param corner_icons data.IconData[]
---@return data.IconData[]
function utils.with_corner_icon(base_icons, corner_icons)
    -- combine_icons gives a layer without scale the default one for its icon_size, then multiplies it by `scale`
    return util.combine_icons(base_icons, corner_icons, { scale = 0.5, shift = { 8, -8 } }, 64)
end

---Add a 24px badge in the lower-right corner of a 64px icon
---@param base_icons data.IconData[]
---@param badge_icon string
---@return data.IconData[]
function utils.with_badge(base_icons, badge_icon)
    return util.combine_icons(
        base_icons,
        { { icon = badge_icon, icon_size = 64 } },
        { scale = 0.375, shift = { 10, 10 } },
        64
    )
end

---Return the path to a specific icon in `mod_root/graphics/icons`
---
---To get icons in nested directories, add a `/`, ex: "fluid/water"
---@param name string
---@return string
utils.icon = function(name) return ('__VoidProcessing-Updated__/graphics/icons/%s.png'):format(name) end

---Return the path to a specific technology icon in `mod_root/graphics/technology`
---
---To get icons in nested directories, add a `/`, ex: "fluid/water"
---@param name string
---@return string
utils.technology_icon = function(name) return ('__VoidProcessing-Updated__/graphics/technology/%s.png'):format(name) end

---Add a recipe category to an `assembling-machine` recipe
---@param base_entity string
---@param new_categories (data.RecipeCategoryID)[]
utils.add_recipe_category = function(base_entity, new_categories)
    data.raw["assembling-machine"][base_entity].crafting_categories = utils.merge_arrays(
        data.raw["assembling-machine"][base_entity].crafting_categories,
        new_categories
    )
end

---Add a new science pack to a lab
---@param base_entity string
---@param new_science (data.RecipeCategoryID)[]
utils.add_science_to_lab = function(base_entity, new_science)
    data.raw["lab"][base_entity].inputs = utils.merge_arrays(
        data.raw["lab"][base_entity].inputs,
        new_science
    )
end

---Return the weight of an item from its rocket stack size,
---assuming the rocket capacity is 1 ton
---@param count number
---@return number
utils.rocket_stack_size = function(count)
    return 1000000 / count
end

utils.prefix = function(name)
    return gloabals.mod_prefix .. "-" .. name
end

return utils
