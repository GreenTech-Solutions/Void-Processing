local lib = require("lib")


-- intermediary recipes

data:extend({

    {
        type = "recipe",
        name = "iron-bacteria-infusing",
        categories = { "organic" },
        energy_required = 10,
        icon = lib.icon("iron-bacteria-infusing"),
        subgroup = "intermediaries",
        order = "a-b",
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item",  name = "nutrients",              amount = 5 },
            { type = "item",  name = "iron-bacteria",          amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 20 }
        },
        results = {
            { type = "item", name = "void-bacteria", amount = 1, always_fresh = true }
        },
        crafting_machine_tint =
        {
            primary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 },   -- #ff7400ff
            secondary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 }, -- #ff3100ff
        },
        surface_conditions = lib.globals.surface_conditions.gleba,
    },

    {
        type = "recipe",
        name = "copper-bacteria-infusing",
        categories = { "organic" },
        energy_required = 10,
        icon = lib.icon("copper-bacteria-infusing"),
        subgroup = "intermediaries",
        order = "a-c",
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item",  name = "nutrients",              amount = 5 },
            { type = "item",  name = "copper-bacteria",        amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 20 }
        },
        results = {
            { type = "item", name = "void-bacteria", amount = 1, always_fresh = true }
        },
        crafting_machine_tint =
        {
            primary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 },   -- #ff7400ff
            secondary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 }, -- #ff3100ff
        },
        surface_conditions = lib.globals.surface_conditions.gleba,
    },

    {
        type = "recipe",
        name = "lithium-holmium-alloy",
        categories = { "metallurgy" },
        energy_required = 10,
        subgroup = "intermediaries",
        order = "b-a",
        enabled = false,
        icons = {
            {
                icon = lib.icon("molten-fluid"),
                icon_size = 64
            },
            {
                icon = "__space-age__/graphics/icons/holmium-plate.png",
                icon_size = 64,
                scale = 32.0 / 64,
                shift = { -16, 4 }
            },
            {
                icon = "__space-age__/graphics/icons/lithium-plate.png",
                icon_size = 64,
                scale = 32.0 / 64,
                shift = { -2, 16 }
            }
        },
        ingredients = {
            { type = "item", name = "lithium-plate", amount = 1 },
            { type = "item", name = "holmium-plate", amount = 2 }
        },
        results = {
            { type = "fluid", name = "lithium-holmium-alloy", amount = 30 },
        }
    },

    {
        type = "recipe",
        name = "crystalization-plating",
        categories = { "cryogenics" },
        energy_required = 10,
        icon = lib.icon("crystalization-plating"),
        subgroup = "intermediaries",
        order = "c-b",
        enabled = false,
        ingredients = {
            { type = "fluid", name = "lithium-holmium-alloy", amount = 10 },
            { type = "fluid", name = "fluoroketone-hot",      amount = 20 }
        },
        results = {
            { type = "item",  name = "crystalization-plating", amount = 1 },
            { type = "fluid", name = "fluoroketone",           amount = 10, ignored_by_productivity = 1 },
        },
        main_product = "crystalization-plating"
    },

    {
        type = "recipe",
        name = "lukewarm-fluoroketone-cooling",
        categories = { "cryogenics" },
        energy_required = 10,
        icon = lib.icon("fluid/fluoroketone-cooling"),
        subgroup = "intermediaries",
        order = "d-a",
        enabled = false,
        ingredients = {
            { type = "fluid", name = "fluoroketone", amount = 10, ignored_by_stats = 10 }
        },
        results = {
            { type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_stats = 10 },
        }
    },

    {
        type = "recipe",
        name = "void-control-unit",
        categories = { "void-crafting-or-fluid-crafting" },
        energy_required = 30,
        icon = lib.icon("void-control-unit"),
        subgroup = "intermediaries",
        order = "e",
        enabled = false,
        ingredients = {
            { type = "item", name = "quantum-processor", amount = 1 },
            { type = "item", name = "tungsten-plate",    amount = 1 },
            { type = "item", name = "superconductor",    amount = 1 },
        },
        results = {
            { type = "item", name = "void-control-unit", amount = 1 },
        },
        main_product = "void-control-unit"
    },
})
