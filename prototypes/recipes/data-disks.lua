local lib = require("lib")

data:extend({
    {
        type = "recipe",
        name = "void-data-disk",
        categories = { "void-crafting" },
        energy_required = 30,
        icon = lib.icon("void-data-disk"),
        allow_productivity = true,
        enabled = false,
        ingredients = {
            { type = "item",  name = "steel-plate",            amount = 1 },
            { type = "item",  name = "void-control-unit",      amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 250 },
        },
        results = {
            { type = "item", name = "void-data-disk", amount = 1 },
        }
    },
    {
        type = "recipe",
        name = "void-data-disk-black-hole",
        categories = { "black-hole-condensing" },
        energy_required = 60,
        icons = {
            {
                icon = lib.icon("void-data-disk"),
            },
            {
                icon = lib.icon("black-hole-icon"),
                icon_size = 64,
                scale = (0.5 * defines.constant.default_icon_size / 64) * 0.5,
                shift = { 4, -4 }
            },

        },
        surface_condition = lib.globals.surface_conditions.space,
        allow_productivity = false,
        enabled = false,
        ingredients = {
            { type = "item", name = "void-data-disk", amount = 1 },
        },
        results = {
            { type = "item", name = "void-data-disk-black-hole", amount = 1 },
        }
    },
})
