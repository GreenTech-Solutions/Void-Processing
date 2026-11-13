---@class VoidLearnable
---@field name string
---@field prototype data.ItemPrototype
---@field disk string
---@field index number

local max_ingredient_uses = 30
local min_technology_uses = 3
-- A science pack is a terminal product that several technologies consume. An item used in dozens of recipes (steel,
-- circuits, or cable in labs such as omega-lab) is an intermediate; synthesizing it from the void would repeat
-- Voidcraft. An item only one or two technologies take (a fish or a barrel that a lab accepting anything researches) is
-- not a science pack either.

-- Items another mod keeps out of recipes of other mods: it would hide the learning recipe and leave the disk unusable.
local excluded_by_mod = {
    -- imagination-final-fixes.lua hides every recipe outside its psychosis categories that takes an imaginary item
    ["rabbasca-underground"] = {
        "rabbasca-hellvent",
        "rabbasca-contained-imagination",
        "rabbasca-rampant-imagination",
        "rabbasca-imaginary-science-pack",
        "rabbasca-psychosis",
    },
}

local function find_item_prototype(name)
    for type_name in pairs(defines.prototypes.item) do
        local item_type = data.raw[type_name]
        local prototype = item_type and item_type[name]
        if prototype then
            return prototype
        end
    end
end

local function has_item_prototype(name)
    for type_name in pairs(defines.prototypes.item) do
        local item_type = data.raw[type_name]
        if item_type and item_type[name] then
            return true
        end
    end

    return false
end

local function all_categories_are_recycling(recipe)
    for _, category in pairs(recipe.categories or { "crafting" }) do
        if not category:find("recycling", 1, true) then
            return false
        end
    end

    return true
end

local function add_science_candidates(candidates)
    local tech_uses = {}
    for _, technology in pairs(data.raw["technology"] or {}) do
        if technology.unit then
            for _, ingredient in pairs(technology.unit.ingredients or {}) do
                tech_uses[ingredient[1]] = (tech_uses[ingredient[1]] or 0) + 1
            end
        end
    end

    local ingredient_uses = {}
    for _, recipe in pairs(data.raw["recipe"] or {}) do
        if not all_categories_are_recycling(recipe) then
            local recipe_ingredients = {}
            for _, ingredient in pairs(recipe.ingredients or {}) do
                if ingredient.type == nil or ingredient.type == "item" then
                    recipe_ingredients[ingredient.name] = true
                end
            end

            for name in pairs(recipe_ingredients) do
                ingredient_uses[name] = (ingredient_uses[name] or 0) + 1
            end
        end
    end

    local not_learnable = {}
    for _, lab in pairs(data.raw["lab"] or {}) do
        for _, input in pairs(lab.inputs or {}) do
            if tech_uses[input] then
                if (ingredient_uses[input] or 0) > max_ingredient_uses then
                    not_learnable[input] = "used in more than " .. max_ingredient_uses .. " recipes"
                elseif tech_uses[input] < min_technology_uses then
                    not_learnable[input] = "used by fewer than " .. min_technology_uses .. " technologies"
                else
                    candidates[input] = true
                end
            end
        end
    end

    local not_learnable_names = {}
    for name, reason in pairs(not_learnable) do
        table.insert(not_learnable_names, name .. " (" .. reason .. ")")
    end
    table.sort(not_learnable_names)

    if #not_learnable_names > 0 then
        log("VoidProcessing-Updated: lab inputs that are not learnable: " .. table.concat(not_learnable_names, ", "))
    end
end

---@return VoidLearnable[]
return function()
    local scope = settings.startup["voidp-learnable-scope"].value
    local candidates = {}
    local learnable_data = data.raw["mod-data"] and data.raw["mod-data"]["voidp-learnable-items"]
    for name, enabled in pairs(learnable_data and learnable_data.data or {}) do
        if enabled then
            candidates[name] = true
        end
    end

    if scope ~= "list-only" then
        add_science_candidates(candidates)
    end

    if scope == "science-and-modules" then
        for name in pairs(data.raw["module"] or {}) do
            candidates[name] = true
        end
    end

    for mod_name, names in pairs(excluded_by_mod) do
        if mods[mod_name] then
            for _, name in pairs(names) do
                if candidates[name] then
                    candidates[name] = nil
                    log("VoidProcessing-Updated: " .. name .. " is not learnable: " .. mod_name .. " keeps it out of other recipes")
                end
            end
        end
    end

    local items = {}
    for name in pairs(candidates) do
        local prototype = find_item_prototype(name)
        if prototype
            and not prototype.hidden
            and not prototype.parameter
            and (prototype.icon or prototype.icons)
            and name:sub(1, #"void-data-disk") ~= "void-data-disk"
        then
            local disk_name = "void-data-disk-" .. name
            if has_item_prototype(disk_name) then
                log("VoidProcessing-Updated: skipping " .. name .. ", item prototype already exists: " .. disk_name)
            else
                table.insert(items, {
                    name = name,
                    prototype = prototype,
                    disk = disk_name,
                })
            end
        end
    end

    table.sort(items, function(left, right)
        return left.name < right.name
    end)

    for index, item in ipairs(items) do
        item.index = index
    end

    log("VoidProcessing-Updated: " .. #items .. " learnable items")
    return items
end
