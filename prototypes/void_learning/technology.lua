local lib = require("lib")

local disk_icon = {
    {
        icon = lib.icon("void-data-disk"),
        icon_size = 64,
    },
}

local function nothing_effect(description_name)
    ---@type data.NothingModifier
    local effect = {
        type = "nothing",
        icons = table.deepcopy(disk_icon),
        effect_description = { "modifier-description." .. description_name },
    }
    return effect
end

local require_all_void = lib.globals.technology.require_all_void
local technologies = {
    {
        type = "technology",
        name = "void-data-learning",
        icon = lib.utils.technology_icon("void-data-disk_256"),
        icon_size = 256,
        essential = false,
        effects = { nothing_effect("void-data-learning") },
        prerequisites = { lib.prefix("void-science-pack"), "void-pylon" },
        unit = lib.technology.cost(2000, require_all_void, 60),
    },
    {
        type = "technology",
        name = "void-synthesis",
        icon = lib.utils.technology_icon("void-data_256"),
        icon_size = 256,
        essential = false,
        effects = { nothing_effect("void-synthesis") },
        prerequisites = { "void-data-learning" },
        unit = lib.technology.cost(3000, require_all_void, 90),
    },
}

local refining_prerequisites = { "void-data-learning" }
if data.raw.technology["legendary-quality"] then
    table.insert(refining_prerequisites, "legendary-quality")
else
    log("VoidProcessing-Updated: legendary-quality technology is missing, omitting it from void-disk-refining prerequisites")
end

table.insert(technologies, {
    type = "technology",
    name = "void-disk-refining",
    icon = lib.utils.technology_icon("void-data-disk_256"),
    icon_size = 256,
    essential = false,
    effects = { nothing_effect("void-disk-refining") },
    prerequisites = refining_prerequisites,
    unit = lib.technology.cost(4000, require_all_void, 90),
})

if settings.startup["voidp-final-quality"].value
    and data.raw.quality
    and data.raw.quality["voidp-void"]
then
    table.insert(technologies, {
        type = "technology",
        name = "void-quality",
        icon = lib.utils.technology_icon("void-core_256px"),
        icon_size = 256,
        essential = false,
        effects = {
            {
                type = "unlock-quality",
                quality = "voidp-void",
            },
            nothing_effect("void-disk-ascension"),
        },
        prerequisites = { "void-disk-refining", "black-hole-data" },
        unit = lib.technology.cost(10000, require_all_void, 120),
    })
end

table.insert(technologies, {
    type = "technology",
    name = "void-synthesis-productivity",
    icons = util.technology_icon_constant_recipe_productivity(lib.utils.technology_icon("void-data_256")),
    essential = false,
    effects = { nothing_effect("void-synthesis-productivity") },
    prerequisites = { "void-synthesis" },
    unit = {
        count_formula = "1.2^L*1000",
        ingredients = require_all_void,
        time = 120,
    },
    max_level = 20,
    upgrade = true,
})

data:extend(technologies)
