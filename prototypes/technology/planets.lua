local lib = require("lib")


data:extend({
    {
        type = "technology",
        name = "black-hole-discovery",
        icons = util.technology_icon_constant_planet(lib.utils.technology_icon("black-hole_256")),
        icon_size = 256,
        essential = false,
        effects = {
            {
                type = "unlock-space-location",
                space_location = "black-hole-approach",
                use_icon_overlay_constant = true
            },

            {
                type = "unlock-space-location",
                space_location = "black-hole",
                use_icon_overlay_constant = true
            },
            lib.technology.unlock_recipe("void-pylon-tuned"),
            lib.technology.unlock_recipe("void-data-disk-black-hole")
        },
        prerequisites = { "void-pylon" },
        unit = lib.technology.cost(2500, lib.globals.technology.require_all_promethium, 60),
    },
})
