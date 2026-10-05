local lib = require("lib")

-- Missing "on_recipe-change"
-- ---Initialize the controls for a recipe that can only be crafted at a specific space location
-- ---@param recipe string
-- ---@param space_location_name string
-- function add_recipe_at_location_handler(recipe, space_location_name)
--     script.on_event(defines.events.on_space_platform_changed_state, function(event)
--         enable_recipe_at_location(event.platform, recipe, space_location_name)
--     end)
-- end

-- ---Only enable a recipe if a space platform is at a specific space location
-- ---@param platform LuaSpacePlatform
-- ---@param recipe string
-- ---@param space_location_name string
-- function enable_recipe_at_location(platform, recipe, space_location_name)
--     local disable = platform.space_location == nil or platform.space_location.name ~= space_location_name
--     toggle_recipe_on_surface(platform.surface, recipe, disable)
-- end

-- ---Enable or disable a recipe on a whole surface
-- ---@param surface LuaSurface
-- ---@param recipe string
-- ---@param disable boolean
-- function toggle_recipe_on_surface(surface, recipe, disable)
--     local entities = surface.find_entities_filtered({ type = { "assembling-machine", "furnace", "rocket-silo" } })

--     for _, entity in pairs(entities) do
--         local ent_recipe = entity.get_recipe()
--         if ent_recipe ~= nil and ent_recipe.name == recipe then
--             entity.disabled_by_script = disable
--         end
--     end
-- end

-- add_recipe_at_location_handler("void-data-disk-black-hole", "black-hole")


---Initialize the controls for an entity that can only work at a specific space location
---@param entity string
---@param space_location_name string
function add_entity_at_location_handler(entity, space_location_name)
    script.on_event(defines.events.on_space_platform_changed_state, function(event)
        enable_entity_at_location(event.platform, entity, space_location_name)
    end)
end

---Only enable a recipe if a space platform is at a specific space location
---@param platform LuaSpacePlatform
---@param entity_name string
---@param space_location_name string
function enable_entity_at_location(platform, entity_name, space_location_name)
    -- The plateform may no have a surface on creation
    if platform.surface == nil then
        return
    end

    local disable = platform.space_location == nil or platform.space_location.name ~= space_location_name
    toggle_entity_on_surface(platform.surface, entity_name, disable)
end

---Enable or disable a recipe on a whole surface
---@param surface LuaSurface
---@param entity_name string
---@param disable boolean
function toggle_entity_on_surface(surface, entity_name, disable)
    local entities = surface.find_entities_filtered({ type = { "assembling-machine", "furnace", "rocket-silo" } })

    for _, entity in pairs(entities) do
        if entity.name == entity_name then
            entity.disabled_by_script = disable
        end
    end
end

add_entity_at_location_handler("void-pylon-tuned", "black-hole")
