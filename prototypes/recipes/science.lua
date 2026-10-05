local lib = require("lib")

data:extend({
    {
        type = "recipe",
        name = "gibberish-data",
        categories = { "void-crafting" },
        energy_required = 10,
        surface_condition = lib.globals.surface_conditions.space,
        allow_productivity = true,
        subgroup = "void-science",
        order = "a-a",
        enabled = false,
        ingredients = {
            { type = "item", name = "void-data-disk-black-hole", amount = 1 },
            { type = "fluid", name = "semi-destabilized-void",    amount = 250 },
        },
        results = {
            { type = "item", name = "gibberish-data-a", amount = 1, independent_probability = 0.2 }, --todo: Set random at load time. For funsies :)
            { type = "item", name = "void-data-disk",   amount = 1, ignored_by_productivity = 1, ignored_by_stats = 1 },
        },
        main_product = "gibberish-data-a"
    },

    {
        type = "recipe",
        name = "gibberish-data-processing-1",
        categories = { "void-crafting" },
        energy_required = 30,
        subgroup = "void-science",
        order = "a-b",
        icons = {
            {
                icon = lib.icon("gibberish-data/c"),
                icon_size = 64,
                scale = 40.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = "__core__/graphics/icons/search.png",
                icon_size = 32,
                scale = 24.0 / 32,
                shift = { 4, 5 }
            },
        },
        surface_condition = lib.globals.surface_conditions.space,
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item", name = "gibberish-data-c", amount = 1 }, --todo: Set random at load time. For funsies :)
        },
        results = {
            { type = "item", name = "gibberish-data-f",     amount = 1, independent_probability = 0.75 }, --todo: Set random at load time. For funsies :)
            { type = "item", name = "unstable-void-matter", amount = 1, independent_probability = 0.25 },
        },
        main_product = "gibberish-data-f"
    },
    {
        type = "recipe",
        name = "gibberish-data-processing-2",
        categories = { "void-crafting" },
        energy_required = 30,
        subgroup = "void-science",
        order = "a-c",
        icons = {
            {
                icon = lib.icon("gibberish-data/e"),
                icon_size = 64,
                scale = 35 / 64,
                shift = { -4, -4 }
            },
            {
                icon = "__core__/graphics/icons/search.png",
                icon_size = 32,
                scale = 24.0 / 32,
                shift = { 4, 5 }
            },
        },
        surface_condition = lib.globals.surface_conditions.space,
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item", name = "gibberish-data-e", amount = 1 }, --todo: Set random at load time. For funsies :)
        },
        results = {
            { type = "item", name = "void-data",            amount = 1, independent_probability = 0.75 }, --todo: Set random at load time. For funsies :)
            { type = "item", name = "gibberish-data-b",     amount = 1, independent_probability = 0.25 },
            { type = "item", name = "unstable-void-matter", amount = 1, independent_probability = 0.1 },
        },
        main_product = "void-data"
    },

    {
        type = "recipe",
        name = lib.prefix("void-science-pack"),
        categories = { "void-crafting" },
        energy_required = 30,
        icon = lib.icon("void-science-pack"),
        surface_condition = lib.globals.surface_conditions.space,
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item", name = "void-core-pristine", amount = 1 },
            { type = "item", name = "void-data",          amount = 5 },
            { type = "item", name = "void-control-unit",  amount = 1 },
        },
        results = {
            { type = "item", name = lib.prefix("void-science-pack"), amount = 5 },
        }
    },


})
