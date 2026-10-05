local lib = require("lib")

local base_core = {
    type = "item",
    icon_size = 64,
    subgroup = "void-cores",
    default_import_location = "nauvis",
    stack_size = 1,
    auto_recycle = false
}

data:extend({

    lib.merge_tables(base_core, {
        name = "void-core-pristine",
        icon = lib.icon("void-core"),
        pictures =
        {
            layers =
            {
                {
                    size = 64,
                    filename = lib.icon("void-core"),
                    scale = 0.5,
                    mipmap_count = 4
                },
                {
                    draw_as_light = true,
                    blend_mode = "additive",
                    size = 64,
                    filename = lib.icon("void-core"),
                    scale = 0.5,
                    tint = { 1, 1, 1, 1 }
                }
            }
        },
        subgroup = "void-cores",
        order = "a-a",
    }),

    -- lib.merge(base_core, {
    --     name = "void-core-pristine-spent",
    --     icon = lib.icon("test"),
    --     order = "b-a",
    -- }),

    -- lib.merge(base_core, {
    --     name = "void-core-inert",
    --     icon = lib.icon("test"),
    --     order = "a-z",
    -- }),
})
