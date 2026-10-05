local lib = require("lib")

data:extend({
    {
        type = "technology",
        name = "unstable-void-matter-destabilizing",
        icons = {
            {
                icon = lib.icon("unstable-void-matter"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = lib.icon("fluid/semi-destabilized-void"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { 4, 4 }
            }, },
        essential = false,
        effects = lib.technology.unlock_recipes({ "unstable-void-matter-destabilizing" }),
        prerequisites = { "promethium-void-culture" },
        unit = lib.technology.cost(500, lib.globals.technology.require_all_promethium, 60)
    },
    {
        type = "technology",
        name = "waste-processing-1",
        icons = {
            {
                icon = "__recycler__/graphics/icons/recycling.png"
            },
            {
                icon = lib.icon("void-promethium"),
                icon_size = 64,
                scale = (0.5 * defines.constant.default_icon_size / 64) * 0.8 * 4,
            },
            {
                icon = "__recycler__/graphics/icons/recycling-top.png"
            },
        },
        essential = false,
        effects = lib.technology.unlock_recipes({ "void-promethium-cleaning", "promethium-void-culture-revitalize" }),
        prerequisites = { "unstable-void-matter-destabilizing" },
        unit = lib.technology.cost(1000, lib.globals.technology.require_all_promethium, 60)
    },
    {
        type = "technology",
        name = "waste-processing-2",
        icons = {
            {
                icon = "__recycler__/graphics/icons/recycling.png"
            },
            {
                icon = lib.icon("fluid/void-crystal-slurry"),
                icon_size = 64,
                scale = (0.5 * defines.constant.default_icon_size / 64) * 0.8 * 4,
            },
            {
                icon = "__recycler__/graphics/icons/recycling-top.png"
            },
        },
        essential = false,
        effects = lib.technology.unlock_recipes({ "void-crystal-slurry-recycling" }),
        prerequisites = { "waste-processing-1", "void-crystals" },
        unit = lib.technology.cost(2000, lib.globals.technology.require_all_promethium, 60)
    },
    {
        type = "technology",
        name = "waste-processing-3",
        icons = {
            {
                icon = "__recycler__/graphics/icons/recycling.png"
            },
            {
                icon = lib.icon("void-core-fractured"),
                icon_size = 64,
                scale = (0.5 * defines.constant.default_icon_size / 64) * 0.8 * 4,
            },
            {
                icon = "__recycler__/graphics/icons/recycling-top.png"
            },
        },
        essential = false,
        effects = lib.technology.unlock_recipes({ "void-core-base-cracked-recycling" }),
        prerequisites = { "waste-processing-2", "void-core-base" },
        unit = lib.technology.cost(3000, lib.globals.technology.require_all_promethium, 60)
    }
})
