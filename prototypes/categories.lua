local lib = require("lib")

data:extend({
    {
        type = "recipe-category",
        name = "void-crafting",
    },
    {
        type = "recipe-category",
        name = "void-crafting-or-fluid-crafting",
    },
    {
        type = "recipe-category",
        name = "void-condensing",
    },
    {
        type = "recipe-category",
        name = "black-hole-condensing",
    },
    {
        type = "recipe-category",
        name = "void-synthesis",
    },
    {
        type = "item-group",
        name = "void-processing",
        order = "f-a",
        icon = lib.icon("void-processing"),
        icon_size = 128,
    },
    {
        type = "item-subgroup",
        name = "void-core-crafting",
        group = "void-processing",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "intermediaries",
        group = "void-processing",
        order = "b"
    },
    {
        type = "item-subgroup",
        name = "void-cores",
        group = "void-processing",
        order = "c"
    },
    {
        type = "item-subgroup",
        name = "void-science",
        group = "void-processing",
        order = "d"
    },
    {
        type = "item-subgroup",
        name = "void-trash",
        group = "void-processing",
        order = "e"
    },
    {
        type = "item-subgroup",
        name = "void-conversion",
        group = "void-processing",
        order = "f"
    },
    {
        type = "item-subgroup",
        name = "data-disks",
        group = "void-processing",
        order = "g"
    },
    {
        type = "item-subgroup",
        name = "void-learning",
        group = "void-processing",
        order = "h"
    },
    {
        type = "item-subgroup",
        name = "void-disk-refining",
        group = "void-processing",
        order = "i"
    },
    {
        type = "item-subgroup",
        name = "void-synthesis",
        group = "void-processing",
        order = "j"
    },
})
