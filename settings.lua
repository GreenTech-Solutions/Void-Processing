data:extend({
    {
        type = "bool-setting",
        name = "disable-new-music",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "string-setting",
        name = "voidp-learnable-scope",
        setting_type = "startup",
        default_value = "science",
        allowed_values = { "science", "science-and-modules", "list-only" },
        order = "b",
    },
    {
        type = "bool-setting",
        name = "voidp-final-quality",
        setting_type = "startup",
        default_value = true,
        order = "c",
    },
})
