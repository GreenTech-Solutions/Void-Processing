local lib = require("lib")

data:extend({
    {
        type = "recipe",
        name = "void-assembler",
        enabled = false,
        energy_required = 30, -- time to craft in seconds (at crafting speed 1)
        icon = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-icon.png",
        categories = { "void-crafting-or-fluid-crafting" },
        ingredients = {
            { type = "item",  name = "tungsten-plate",         amount = 15 },
            { type = "item",  name = "void-control-unit",      amount = 3 },
            { type = "item",  name = "void-core-pristine",     amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 250 },
        },
        results = { { type = "item", name = "void-assembler", amount = 1 } }
    },

    {
        type = "recipe",
        name = "void-pylon",
        enabled = false,
        energy_required = 15,
        icon = lib.icon("void-pylon"),
        categories = { "void-crafting" },
        ingredients = {
            { type = "item",  name = "tungsten-plate",         amount = 2 },
            { type = "item",  name = "void-control-unit",      amount = 4 },
            { type = "item",  name = "void-core-pristine",     amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 100 },
        },
        results = { { type = "item", name = "void-pylon", amount = 1 } }
    },
    {
        type = "recipe",
        name = "void-pylon-tuned",
        enabled = false,
        energy_required = 15,
        icon = lib.icon("void-pylon"),
        categories = { "void-crafting" },
        ingredients = { { type = "item", name = "void-pylon", amount = 1 } },
        results = { { type = "item", name = "void-pylon-tuned", amount = 1 } },
        main_product = "void-pylon-tuned"
    }
})
