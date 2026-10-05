local lib = require("lib")

data:extend({
    {
        type = "item",
        name = "void-assembler",
        icon = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-icon.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "g",
        default_import_location = "nauvis",
        stack_size = 20,
        place_result = "void-assembler",
        weight = lib.utils.rocket_stack_size(20)
    },

    {
        type = "item",
        name = "void-pylon",
        icon = lib.icon("void-pylon"),
        icon_size = 64,
        subgroup = "production-machine",
        order = "h",
        default_import_location = "nauvis",
        stack_size = 20,
        place_result = "void-pylon",
        weight = lib.utils.rocket_stack_size(20)
    },
    {
        type = "item",
        name = "void-pylon-tuned",
        icon = lib.icon("void-pylon"),
        icon_size = 64,
        subgroup = "production-machine",
        order = "i",
        default_import_location = "nauvis",
        stack_size = 20,
        place_result = "void-pylon-tuned",
        weight = lib.utils.rocket_stack_size(20)
    },
})
