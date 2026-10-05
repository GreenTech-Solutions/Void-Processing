local lib = require("lib")

data:extend({
    lib.merge_tables(data.raw["recipe"]["oxide-asteroid-crushing"], {
        type = "recipe",
        name = "promethium-crushing",
        icon = lib.icon("promethium-crushing"),
        enabled = false,
        subgroup = "void-core-crafting",
        order = "a",
        surface_condition = lib.globals.surface_conditions.space,
        energy_required = 8,
        ingredients = {
            { type = "item", name = "promethium-asteroid-chunk", amount = 1 },
        },
        results = { { type = "item", name = "crushed-promethium", amount = 2 } },
        allow_productivity = true,
    }),

    lib.merge_tables(data.raw["recipe"]["pentapod-egg"], {
        type = "recipe",
        name = "promethium-void-culture",
        enabled = false,
        energy_required = 5, -- time to craft in seconds (at crafting speed 1)
        icon = lib.icon("void-culture"),
        subgroup = "void-core-crafting",
        order = "b",
        ingredients = {
            { type = "item",  name = "crushed-promethium",     amount = 3 },
            { type = "item",  name = "void-bacteria",          amount = 2 },
            { type = "fluid", name = "semi-destabilized-void", amount = 50 }
        },
        results = { { type = "item", name = "promethium-void-culture", amount = 2, ignored_by_productivity = 2, always_fresh = true } },
        allow_productivity = true,
        auto_recycle = true,
        surface_condition = lib.globals.surface_conditions.gleba,
    }),

    {
        type = "recipe",
        name = "void-crystals",
        categories = { "cryogenics" },
        icon = lib.icon("void-crystals"),
        subgroup = "void-core-crafting",
        order = "c",
        surface_conditions = lib.globals.surface_conditions.aquilo,
        enabled = false,
        ingredients = {
            { type = "item",  name = "promethium-void-culture", amount = 1 },
            { type = "item",  name = "crystalization-plating",  amount = 3 },
            { type = "fluid", name = "fluoroketone-cold",       amount = 100, ignored_by_stats = 90 },
            { type = "fluid", name = "semi-destabilized-void",  amount = 20 }
        },
        results = {
            { type = "item",  name = "void-crystals",        amount_min = 0, amount_max = 3, },
            { type = "fluid", name = "void-crystals-slurry", amount_min = 0, amount_max = 25 },
            { type = "fluid", name = "fluoroketone-hot",     amount = 90,    ignored_by_stats = 90, ignored_by_productivity = 90 }
        },
        energy_required = 20,
        main_product = "void-crystals",
        allow_productivity = true,
        crafting_machine_tint =
        {
            primary = { r = 0.040, g = 0.186, b = 1.000, a = 1.000 },    -- #0a2fffff
            secondary = { r = 0.200, g = 0.400, b = 1.000, a = 1.000 },  -- #3366ffff
            tertiary = { r = 0.600, g = 0.651, b = 1.000, a = 1.000 },   -- #99a6ffff
            quaternary = { r = 0.100, g = 0.300, b = 0.500, a = 1.000 }, -- #194c7fff
        }
    },
    {
        type = "recipe",
        name = "void-core-chunk",
        categories = { "chemistry" },
        energy_required = 5,
        subgroup = "void-core-crafting",
        order = "d",
        surface_condition = lib.globals.surface_conditions.nauvis,
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item",  name = "void-crystals", amount = 1 },
            { type = "item",  name = "uranium-235",   amount = 2 },
            { type = "fluid", name = "sulfuric-acid", amount = 10 }
        },
        results = {
            { type = "item", name = "void-core-chunk",        amount_min = 1, amount_max = 2 },
            { type = "item", name = "crystalization-plating", amount = 1,     independent_probability = 0.5 },
            { type = "item", name = "void-promethium",        amount = 1,     independent_probability = 0.25 },
            { type = "item", name = "unstable-void-matter",   amount = 1,     independent_probability = 0.1 },
        },
        main_product = "void-core-chunk"
    },
    {
        type = "recipe",
        name = "void-core-base-heated",
        categories = { "metallurgy" },
        energy_required = 10,
        surface_condition = lib.globals.surface_conditions.vulcanus,
        subgroup = "void-core-crafting",
        order = "e",
        enabled = false,
        ingredients = {
            { type = "item",  name = "void-core-chunk", amount = 5 },
            { type = "fluid", name = "lava",            amount = 20 }
        },
        results = {
            { type = "item", name = "void-core-base-heated", amount = 1, ignored_by_productivity = 1 },
            { type = "item", name = "stone",                 amount = 10 },
        },
        main_product = "void-core-base-heated"
    },

    {
        type = "recipe",
        name = "void-core-base",
        categories = { "cryogenics" },
        energy_required = 90,
        subgroup = "void-core-crafting",
        order = "f",
        enabled = false,
        ingredients = {
            { type = "item",  name = "void-core-base-heated", amount = 1 },
            { type = "fluid", name = "fluoroketone-hot",      amount = 20, ignored_by_stats = 90 },
        },
        results = {
            { type = "item",  name = "void-core-base", amount = 1,  ignored_by_productivity = 1 },
            { type = "fluid", name = "fluoroketone",   amount = 18, ignored_by_stats = 15,      ignored_by_productivity = 15 },
        },
        main_product = "void-core-base"
    },

    {
        type = "recipe",
        name = "void-core-activation",
        categories = { "electromagnetics" },
        energy_required = 10,
        enabled = false,
        surface_condition = lib.globals.surface_conditions.fulgora,
        subgroup = "void-core-crafting",
        order = "g",
        ingredients = {
            { type = "item",  name = "void-core-base",         amount = 1 },
            { type = "fluid", name = "electrolyte",            amount = 25, ignored_by_stats = 10 },
            { type = "fluid", name = "semi-destabilized-void", amount = 25 }
        },
        results = {
            { type = "item",  name = "void-core-pristine",     amount = 1,  independent_probability = 0.8 },
            { type = "item",  name = "void-core-base-cracked", amount = 1,  independent_probability = 0.2 },
            { type = "fluid", name = "electrolyte",            amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10 },
        },
        main_product = "void-core-pristine"
    }
})
