local lib = require("lib")

data:extend({
    {
        type = "recipe",
        name = "petroleum-destabilizing",
        categories = { "chemistry" },
        energy_required = 20,
        enabled = false,
        icons = {
            {
                icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = lib.icon("fluid/semi-destabilized-void"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { 4, 4 }
            },
        },
        subgroup = "void-conversion",
        order = "b",
        ingredients = {
            { type = "fluid", name = "petroleum-gas", amount = 500 }
        },
        results = { { type = "fluid", name = "semi-destabilized-void", amount = 100 } },
    },

    {
        type = "recipe",
        name = "bioflux-destabilizing",
        categories = { "organic" },
        energy_required = 20,
        enabled = false,
        icons = {
            {
                icon = "__space-age__/graphics/icons/bioflux.png",
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = lib.icon("fluid/semi-destabilized-void"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { 4, 4 }
            },
        },
        subgroup = "void-conversion",
        order = "c",
        ingredients = {
            { type = "item", name = "bioflux",       amount = 1 },
            { type = "item", name = "void-bacteria", amount = 1 },
        },
        results = {
            { type = "fluid", name = "semi-destabilized-void", amount = 250 },
            { type = "item",  name = "void-bacteria",          amount = 1,  independent_probability = 0.75, always_fresh = true }
        },
        crafting_machine_tint =
        {
            primary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 },   -- #ff7400ff
            secondary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 }, -- #ff3100ff
        },
    },

    {
        type = "recipe",
        name = "rocket-fuel-destabilizing",
        categories = { "chemistry" },
        energy_required = 20,
        enabled = false,
        icons = {
            {
                icon = "__base__/graphics/icons/rocket-fuel.png",
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = lib.icon("fluid/semi-destabilized-void"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { 4, 4 }
            },
        },
        subgroup = "void-conversion",
        order = "d",
        ingredients = {
            { type = "item", name = "rocket-fuel", amount = 1 }
        },
        results = { { type = "fluid", name = "semi-destabilized-void", amount = 250 } },
    },

    {
        type = "recipe",
        name = "unstable-void-matter-destabilizing",
        categories = { "chemistry", "cryogenics" },
        energy_required = 2,
        enabled = false,
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
            },
        },
        subgroup = "void-conversion",
        order = "a",
        ingredients = {
            { type = "item", name = "unstable-void-matter", amount = 1 },
        },
        results = {
            { type = "fluid", name = "semi-destabilized-void", amount = 10 },
        },
        crafting_machine_tint =
        {
            primary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 },   -- #ff7400ff
            secondary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 }, -- #ff3100ff
        },
    },

    {
        type = "recipe",
        name = "thruster-fuel-destabilizing",
        categories = { "void-crafting" },
        energy_required = 2,
        enabled = false,
        icons = {
            {
                icon = "__space-age__/graphics/icons/fluid/thruster-fuel.png",
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { -4, -4 }
            },
            {
                icon = lib.icon("fluid/semi-destabilized-void"),
                icon_size = 64,
                scale = 48.0 / 64,
                shift = { 4, 4 }
            },
        },
        subgroup = "void-conversion",
        order = "e",
        ingredients = {
            { type = "fluid", name = "thruster-fuel", amount = 750 },
        },
        results = {
            { type = "fluid", name = "semi-destabilized-void", amount = 1000 },
        },
        crafting_machine_tint =
        {
            primary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 },   -- #ff7400ff
            secondary = { r = 0.54, g = 0.12, b = 0.80, a = 1.000 }, -- #ff3100ff
        },
    },
})
