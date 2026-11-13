-- The tuned void pylon only works while its space platform is stopped at Oratl (space location "black-hole").
-- There is no event for a recipe change, so the pylon is a separate entity that the script turns off and on:
-- when a platform changes state, when a pylon is built, and once for every surface when the mod set changes.

local migrated_storage = require("migrated_storage")

local pylon_name = "void-pylon-tuned"
local location_name = "black-hole"

---@param surface LuaSurface
---@return boolean
local function works_on(surface)
    local platform = surface.platform
    return platform ~= nil and platform.space_location ~= nil and platform.space_location.name == location_name
end

---@param surface LuaSurface
local function update_surface(surface)
    local disable = not works_on(surface)
    for _, entity in pairs(surface.find_entities_filtered({ name = pylon_name })) do
        entity.disabled_by_script = disable
    end
end

local function update_all_surfaces()
    for _, surface in pairs(game.surfaces) do
        update_surface(surface)
    end
end

local unlock_recipe_technologies = {
    "void-data-learning",
    "void-synthesis",
    "void-disk-refining",
    "void-quality",
}

local function update_void_learning_technology_effects(force)
    -- Do not call force.reset_technology_effects(): Voidcraft enables its -qual recipes by script, and a reset would disable them.
    for _, technology_name in ipairs(unlock_recipe_technologies) do
        local force_technology = force.technologies[technology_name]
        local technology_prototype = prototypes.technology[technology_name]
        if force_technology and force_technology.researched and technology_prototype then
            for _, effect in pairs(technology_prototype.effects or {}) do
                if effect.type == "unlock-recipe" then
                    local recipe = force.recipes[effect.recipe]
                    if recipe then
                        recipe.enabled = true
                    end
                end
            end
        end
    end

    local technology_name = "void-synthesis-productivity"
    local force_technology = force.technologies[technology_name]
    local technology_prototype = prototypes.technology[technology_name]
    if force_technology and technology_prototype then
        local levels = force_technology.researched and force_technology.level or force_technology.level - 1
        for _, effect in pairs(technology_prototype.effects or {}) do
            if effect.type == "change-recipe-productivity" then
                local recipe = force.recipes[effect.recipe]
                if recipe then
                    recipe.productivity_bonus = math.max(recipe.productivity_bonus, effect.change * levels)
                end
            end
        end
    end
end

-- A save that had the original VoidProcessing (migrates_from in info.json) hands its storage over; that mod keeps
-- nothing there, so it is dropped.
local function on_mod_set_changed()
    migrated_storage.take({ "VoidProcessing" })
    update_all_surfaces()
    for _, force in pairs(game.forces) do
        update_void_learning_technology_effects(force)
    end
end

script.on_init(on_mod_set_changed)
script.on_configuration_changed(on_mod_set_changed)

script.on_event(defines.events.on_space_platform_changed_state, function(event)
    -- A platform has no surface right after it is created
    local surface = event.platform.surface
    if surface then
        update_surface(surface)
    end
end)

---@param entity LuaEntity?
local function update_built(entity)
    if entity and entity.valid then
        entity.disabled_by_script = not works_on(entity.surface)
    end
end

---@param event EventData.on_built_entity|EventData.on_robot_built_entity|EventData.on_space_platform_built_entity|EventData.script_raised_built|EventData.script_raised_revive
local function on_built(event)
    update_built(event.entity)
end

local built_filter = { { filter = "name", name = pylon_name } }
script.on_event(defines.events.on_built_entity, on_built, built_filter)
script.on_event(defines.events.on_robot_built_entity, on_built, built_filter)
script.on_event(defines.events.on_space_platform_built_entity, on_built, built_filter)
script.on_event(defines.events.script_raised_built, on_built, built_filter)
script.on_event(defines.events.script_raised_revive, on_built, built_filter)
script.on_event(defines.events.on_entity_cloned, function(event) update_built(event.destination) end, built_filter)
