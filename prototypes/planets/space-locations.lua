local lib = require("lib")


data:extend({
    {
        type = "space-location",
        name = "black-hole",
        icon = lib.icon("black-hole"),
        starmap_icon = lib.icon("black-hole"),
        starmap_icon_size = 64,
        order = "g[black-hole]-b",
        subgroup = "planets",
        gravity_pull = 100,
        distance = 60,
        orientation = 0.20,
        magnitude = 2.5,
        label_orientation = 0,
        asteroid_spawn_influence = 1,
        draw_orbit = false,
        --asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aq, 0.9)
    },
    ---@type data.SpaceLocationPrototype
    {
        type = "space-location",
        name = "black-hole-approach",
        icon = lib.icon("black-hole-approach"),
        starmap_icon = lib.icon("black-hole-approach"),
        starmap_icon_size = 64,
        order = "g[black-hole]-a",
        subgroup = "planets",
        gravity_pull = 10,
        distance = 60,
        orientation = 0.21,
        magnitude = 1.0,
        label_orientation = 0.15,
        asteroid_spawn_influence = 1,
        draw_orbit = false,
        --asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.black_hole_asteroids, 0.9)
    },

})
