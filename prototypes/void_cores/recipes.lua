local lib = require("lib")

function add_charge_recipe(name, void_count)
    data:extend({
        {
            type = "recipe",
            name = ('%s-recharge'):format(name),
            enabled = true,
            icon = lib.icon("test"),
            energy_required = 5, -- time to craft in seconds (at crafting speed 1)
            categories = { "void-crafting" },
            ingredients = {
                { type = "item",  name = ('%s-spent'):format(name), amount = 1 },
                { type = "fluid", name = "semi-destabilized-void",  amount = void_count }
            },
            results = { { type = "item", name = name, amount = 1 } },
        }

    })
end

function add_discharge_recipe(name, void_count, degraded_name)
    data:extend({
        {
            type = "recipe",
            name = ('%s-discharge'):format(name),
            enabled = true,
            icon = lib.icon("test"),
            energy_required = 5, -- time to craft in seconds (at crafting speed 1)
            categories = { "void-crafting" },
            ingredients = {
                { type = "item", name = name, amount = 1 },
            },
            results = {
                { type = "item",  name = degraded_name,            amount = 1 },
                { type = "fluid", name = "semi-destabilized-void", amount = void_count }
            },
        }
    })
end

add_charge_recipe("void-core-pristine", 100000)
add_discharge_recipe("void-core-pristine", 100000, "void-core-inert")


data:extend({
    {
        type = "recipe",
        name = "void-core-inert-rebuild",
        enabled = true,
        energy_required = 10, -- time to craft in seconds (at crafting speed 1)
        categories = { "void-crafting" },
        ingredients = {
            { type = "item",  name = "void-core-inert",        amount = 1 },
            { type = "fluid", name = "semi-destabilized-void", amount = 200 }
        },
        results = { { type = "item", name = "void-core-pristine-spent", amount = 1 } },
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
    }
})