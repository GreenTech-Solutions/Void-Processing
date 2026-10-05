local lib = require("lib")

local pipe_pic = require("__base__.prototypes.entity.assembler-pictures").assembler3pipepictures
---@diagnostic disable-next-line: undefined-global
local pipecoverpic = pipecoverspictures()

data:extend({
    lib.merge_tables(data.raw["assembling-machine"]["assembling-machine-3"], {
        name = "void-assembler",
        icon = "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-icon.png",
        icon_size = 64,
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        energy_usage = "2.1MW",
        module_slots = 6,
        crafting_categories = {
            "void-crafting",
            "void-crafting-or-fluid-crafting"
        },
        crafting_speed = 2,
        corpse = "big-remnants",
        next_upgrade = "nil",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename =
                        "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-shadow.png",
                        priority = "high",
                        width = 520,
                        height = 500,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 99,
                        animation_speed = 0.3,
                        shift = util.by_pixel_hr(0, -16),
                        draw_as_shadow = true,
                        scale = 0.5,
                    },
                    {
                        priority = "high",
                        width = 320,
                        height = 320,
                        frame_count = 99,
                        shift = util.by_pixel_hr(0, -16),
                        animation_speed = 0.3,
                        scale = 0.5,
                        stripes = {
                            {
                                filename =
                                "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename =
                                "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-2.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    fadeout = true,
                    secondary_draw_order = 1,
                    animation = {
                        priority = "high",
                        size = { 320, 320 },
                        shift = util.by_pixel_hr(0, -16),
                        frame_count = 99,
                        draw_as_glow = true,
                        scale = 0.5,
                        animation_speed = 0.3,
                        blend_mode = "additive",
                        stripes = {
                            {
                                filename =
                                "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-emission-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename =
                                "__finely-crafted-graphics__/graphics/gravity-assembler/gravity-assembler-hr-animation-emission-2.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                        },
                    },
                }
            },
            reset_animation_when_frozen = true
        },
        fluid_boxes = {
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = pipe_pic,
                pipe_covers = pipecoverpic,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { -1, -2.3 } } },
            },
            {
                production_type = "input",
                volume = 1000,
                pipe_picture = pipe_pic,
                pipe_covers = pipecoverpic,
                pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 1, -2.3 } } },
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_picture = pipe_pic,
                pipe_covers = pipecoverpic,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { -1, 2.3 } } },
            },
            {
                production_type = "output",
                volume = 1000,
                pipe_picture = pipe_pic,
                pipe_covers = pipecoverpic,
                pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 1, 2.3 } } },
            },
        },
    })
})


data:extend({
    {
        type = "assembling-machine",
        name = "void-pylon",
        icon = lib.icon("void-pylon"),
        flags = { "placeable-neutral", "placeable-player", "player-creation" },

        icon_size = 64,
        selection_box = { { -1, -1 }, { 1, 1 } },
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        energy_usage = "2.1MW",
        module_slots = 2,
        crafting_categories = {
            "void-condensing",
        },
        minable = { mining_time = 0.2, result = "void-pylon" },
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = { pollution = 4 }
        },
        crafting_speed = 1,
        corpse = "big-remnants",
        graphics_set = {
            animation = {
                layers = {
                    {
                        priority = "high",
                        width = 143,
                        height = 256,
                        frame_count = 60,
                        shift = util.by_pixel(0, -15),
                        animation_speed = 0.5,
                        scale = 0.35,
                        stripes = {
                            {
                                filename =
                                "__VoidProcessing__/graphics/entity/void-pylon.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            }
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    {
                        priority = "high",
                        width = 143,
                        height = 256,
                        frame_count = 60,
                        shift = util.by_pixel(0, -15),
                        animation_speed = 0.5,
                        scale = 0.35,
                        stripes = {
                            {
                                filename =
                                "__VoidProcessing__/graphics/entity/void-pylon.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            }
                        },
                    },
                },
            },
            reset_animation_when_frozen = true
        },
        allowed_effects = { "consumption", "speed", "pollution", "quality" }
    }
})

data:extend({
    {
        type = "furnace",
        name = "void-pylon-tuned",
        icon = lib.icon("void-pylon"),
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        surface_conditions = lib.globals.surface_conditions.space,
        icon_size = 64,
        selection_box = { { -1, -1 }, { 1, 1 } },
        collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
        energy_usage = "2.1MW",
        module_slots = 2,
        crafting_categories = {
            "black-hole-condensing",
        },
        minable = { mining_time = 0.2, result = "void-pylon" },
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = { pollution = 4 }
        },
        source_inventory_size = 1,
        result_inventory_size = 1,
        crafting_speed = 1,
        corpse = "big-remnants",
        graphics_set = {
            animation = {
                layers = {
                    {
                        priority = "high",
                        width = 143,
                        height = 256,
                        frame_count = 60,
                        shift = util.by_pixel(0, -15),
                        animation_speed = 0.5,
                        scale = 0.35,
                        stripes = {
                            {
                                filename =
                                "__VoidProcessing__/graphics/entity/void-pylon.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            }
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    {
                        priority = "high",
                        width = 143,
                        height = 256,
                        frame_count = 60,
                        shift = util.by_pixel(0, -15),
                        animation_speed = 0.5,
                        scale = 0.35,
                        stripes = {
                            {
                                filename =
                                "__VoidProcessing__/graphics/entity/void-pylon.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            }
                        },
                    },
                },
            },
            reset_animation_when_frozen = true
        },
        allowed_effects = { "consumption", "speed", "pollution", "quality" }
    }
})
