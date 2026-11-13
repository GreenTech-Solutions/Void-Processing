local lib = require("lib")
local utils = lib.utils

---@param items VoidLearnable[]
return function(items)
    for _, item in ipairs(items) do
        data:extend({
            ---@type data.ItemWithTagsPrototype
            {
                type = "item-with-tags",
                name = item.disk,
                localised_name = { "item-name.void-data-disk-of", utils.item_localised_name(item.prototype) },
                localised_description = { "item-description.void-data-disk-of", utils.item_localised_name(item.prototype) },
                icons = utils.with_corner_icon(
                    { { icon = lib.icon("void-data-disk"), icon_size = 64 } },
                    utils.icons_of(item.prototype)
                ),
                stack_size = 10,
                subgroup = "data-disks",
                order = "e-" .. string.format("%04d", item.index),
                auto_recycle = false,
                weight = utils.rocket_stack_size(100),
            },
        })
    end
end
