local lib = require("lib")

data:extend({
    ---@type data.ItemPrototype
    {
        type = "item",
        name = "void-data-disk",
        stack_size = 50,
        icon = lib.icon("void-data-disk"), --TODO
        subgroup = "intermediaries",
        order = "d",
        auto_recycle = false,
        weight = lib.utils.rocket_stack_size(100)
    },
})

---Add a data disk
---@param data_name string
---@param order string
---@param icon? string
function add_data_disk(data_name, order, icon)
    if icon ~= nil then
        icon = lib.icon(icon)
    else
        icon = data.raw["item"][data_name].icon
    end

    data:extend({
        ---@type data.ItemPrototype
        {
            type = "item",
            name = "void-data-disk-" .. data_name,
            stack_size = 10,
            icons = {
                {
                    icon = lib.icon("void-data-disk"),
                },
                {
                    icon = icon,
                    icon_size = 64,
                    scale = (0.5 * defines.constant.default_icon_size / 64) * 0.5,
                    shift = { 4, -4 }
                },

            },
            subgroup = "data-disks",
            order = "d-" .. order,
            auto_recycle = false
        },
    })
end

add_data_disk("black-hole", "a", "black-hole-icon")
-- add_data_disk("iron-plate", "b")
-- add_data_disk("copper-plate", "c")
-- add_data_disk("plastic-bar", "d")
-- add_data_disk("sulfur", "e")
