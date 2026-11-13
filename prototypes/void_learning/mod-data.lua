local lib = require("lib")

data:extend({
    ---@type data.ModData
    {
        type = "mod-data",
        name = "voidp-learnable-items",
        data_type = "VoidProcessing.learnable",
        -- Other mods add items in data-updates: data.raw["mod-data"]["voidp-learnable-items"].data["my-item"] = true
        data = { [lib.prefix("void-science-pack")] = true },
    },
})
