---@class data.RecipePrototype
---@field rigor_blacklist? boolean read by rigor-module

local lib = require("lib")
local utils = lib.utils

local function common_recipe(name, category, energy_required)
    return {
        type = "recipe",
        name = name,
        categories = { category },
        energy_required = energy_required,
        enabled = false,
        hide_from_player_crafting = true,
        allow_decomposition = false,
        auto_recycle = false,
        allow_quality = false,
        rigor_blacklist = true,
    }
end

local function append_recipe(prototypes, names, recipe)
    table.insert(prototypes, recipe)
    table.insert(names, recipe.name)
end

---@param items VoidLearnable[]
return function(items)
    local prototypes = {}
    local names = {
        learning = {},
        refining = {},
        ascension = {},
        synthesis = {},
    }
    local has_legendary = data.raw.quality and data.raw.quality.legendary ~= nil
    local has_void_quality = settings.startup["voidp-final-quality"].value
        and data.raw.quality
        and data.raw.quality["voidp-void"] ~= nil

    if not has_legendary then
        log("VoidProcessing-Updated: legendary quality is missing, skipping disk refining recipes")
    end

    for _, item in ipairs(items) do
        local disk = data.raw["item-with-tags"][item.disk]
        if not disk then
            log("VoidProcessing-Updated: skipping recipes for " .. item.name .. ", item prototype is missing: " .. item.disk)
        else
            local item_name = utils.item_localised_name(item.prototype)
            local item_icons = utils.icons_of(item.prototype)
            local disk_icons = utils.icons_of(disk)
            local order = string.format("%04d", item.index)

            local learning = common_recipe(item.disk, "void-condensing", 60)
            learning.can_set_quality = true
            learning.allow_productivity = false
            learning.localised_name = { "recipe-name.void-learning", item_name }
            learning.localised_description = { "recipe-description.void-learning" }
            learning.icons = utils.with_badge(item_icons, lib.icon("void-data-disk"))
            learning.subgroup = "void-learning"
            learning.order = disk.order
            learning.ingredients = {
                { type = "item", name = "void-data-disk", amount = 1, quality_min = "normal", quality_max = "normal" },
                { type = "item", name = item.name, amount = math.min(50, item.prototype.stack_size) },
            }
            learning.results = {
                { type = "item", name = item.disk, amount = 1, affected_by_quality = false },
            }
            append_recipe(prototypes, names.learning, learning)

            if has_legendary then
                local refining = common_recipe("void-disk-refining-" .. item.name, "void-synthesis", 120)
                refining.main_product = item.disk
                refining.allow_productivity = false
                refining.localised_name = { "recipe-name.void-disk-refining", item_name }
                refining.localised_description = { "recipe-description.void-disk-refining" }
                refining.icons = utils.with_badge(disk_icons, lib.icon("void-data"))
                refining.subgroup = "void-disk-refining"
                refining.order = "a-" .. order
                refining.ingredients = {
                    { type = "item", name = item.disk, amount = 1 },
                    { type = "item", name = "void-data", amount = 2, quality_min = "normal", quality_max = "normal" },
                    { type = "fluid", name = "semi-destabilized-void", amount = 1000 },
                }
                refining.results = {
                    {
                        type = "item",
                        name = item.disk,
                        amount = 1,
                        quality_change = 1,
                        quality_max = "legendary",
                        affected_by_quality = false,
                        shared_probability = { min = 0, max = 0.5 },
                    },
                    {
                        type = "item",
                        name = item.disk,
                        amount = 1,
                        affected_by_quality = false,
                        shared_probability = { min = 0.5, max = 0.9 },
                    },
                }
                append_recipe(prototypes, names.refining, refining)
            end

            if has_void_quality then
                local ascension = common_recipe("void-disk-ascension-" .. item.name, "black-hole-condensing", 300)
                ascension.surface_conditions = lib.globals.surface_conditions.space
                ascension.allow_productivity = false
                ascension.localised_name = { "recipe-name.void-disk-ascension", item_name }
                ascension.localised_description = { "recipe-description.void-disk-ascension" }
                ascension.icons = utils.with_badge(disk_icons, lib.icon("black-hole-icon"))
                ascension.subgroup = "void-disk-refining"
                ascension.order = "b-" .. order
                ascension.ingredients = {
                    { type = "item", name = item.disk, amount = 1, quality_min = "legendary", quality_max = "legendary" },
                }
                ascension.results = {
                    {
                        type = "item",
                        name = item.disk,
                        amount = 1,
                        quality_min = "voidp-void",
                        quality_max = "voidp-void",
                        independent_probability = 0.25,
                        affected_by_quality = false,
                    },
                }
                append_recipe(prototypes, names.ascension, ascension)
            end

            local synthesis = common_recipe("void-synthesis-" .. item.name, "void-synthesis", 20)
            synthesis.main_product = item.name
            synthesis.allow_productivity = true
            synthesis.maximum_productivity = 1
            synthesis.localised_name = { "recipe-name.void-synthesis", item_name }
            synthesis.localised_description = { "recipe-description.void-synthesis" }
            synthesis.icons = utils.with_badge(item_icons, lib.icon("fluid/semi-destabilized-void"))
            synthesis.subgroup = "void-synthesis"
            synthesis.order = order
            synthesis.ingredients = {
                { type = "item", name = item.disk, amount = 1, ignored_by_stats = 1 },
                { type = "item", name = "void-data", amount = 1, quality_min = "normal", quality_max = "normal" },
                { type = "fluid", name = "semi-destabilized-void", amount = 500 },
            }
            synthesis.results = {
                { type = "item", name = item.name, amount = 1, affected_by_quality = false },
                {
                    type = "item",
                    name = item.disk,
                    amount = 1,
                    independent_probability = 0.99,
                    ignored_by_productivity = 1,
                    ignored_by_stats = 1,
                    affected_by_quality = false,
                },
            }
            append_recipe(prototypes, names.synthesis, synthesis)
        end
    end

    if #prototypes > 0 then
        data:extend(prototypes)
    end

    return names
end
