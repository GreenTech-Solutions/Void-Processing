-- The fields Void quality copies from the quality before it, and the engine defaults of each (Factorio 2.1 API), so the
-- value copied is the one in effect even when the field is not set. Used by prototypes/quality.lua (data stage) and
-- prototypes/quality_sync.lua (data-final-fixes).

local function effective(quality, field)
    local value = quality[field]
    if value ~= nil then
        return value
    end

    local defaults = {
        default_multiplier = function(prototype) return 1 + 0.3 * prototype.level end,
        inserter_speed_multiplier = "default_multiplier",
        fluid_wagon_capacity_multiplier = "default_multiplier",
        inventory_size_multiplier = "default_multiplier",
        cargo_wagon_inventory_size_multiplier = "inventory_size_multiplier",
        locomotive_power_multiplier = function(prototype) return 1 + 0.01 * prototype.level end,
        rolling_stock_max_speed_multiplier = function(prototype) return 1 + 0.01 * prototype.level end,
        lab_research_speed_multiplier = "default_multiplier",
        crafting_machine_speed_multiplier = "default_multiplier",
        crafting_machine_energy_usage_multiplier = 1,
        logistic_cell_charging_energy_multiplier = "default_multiplier",
        accumulator_capacity_multiplier = function(prototype) return 1 + prototype.level end,
        flying_robot_max_energy_multiplier = function(prototype) return 1 + prototype.level end,
        range_multiplier = function(prototype) return math.min(1 + 0.1 * prototype.level, 3) end,
        asteroid_collector_collection_radius_bonus = "level",
        equipment_grid_width_bonus = "level",
        equipment_grid_height_bonus = "level",
        electric_pole_wire_reach_bonus = function(prototype) return 2 * prototype.level end,
        electric_pole_supply_area_distance_bonus = "level",
        beacon_supply_area_distance_bonus = function(prototype) return math.min(math.max(prototype.level, 0), 64) end,
        mining_drill_mining_radius_bonus = "level",
        beacon_power_usage_multiplier = 1,
        mining_drill_resource_drain_multiplier = 1,
        science_pack_drain_multiplier = 1,
        module_consumption_multiplier = "default_multiplier",
        module_speed_multiplier = "default_multiplier",
        module_productivity_multiplier = "default_multiplier",
        module_pollution_multiplier = "default_multiplier",
        module_quality_multiplier = "default_multiplier",
        spoil_ticks_multiplier = "default_multiplier",
        logistic_cell_charging_station_count_bonus = "level",
        beacon_module_slots_bonus = "level",
        crafting_machine_module_slots_bonus = "level",
        mining_drill_module_slots_bonus = "level",
        lab_module_slots_bonus = "level",
    }

    local default = defaults[field]
    if type(default) == "function" then
        return default(quality)
    elseif type(default) == "string" then
        return effective(quality, default)
    end

    return default
end

local copied_fields = {
    "default_multiplier",
    "inserter_speed_multiplier",
    "fluid_wagon_capacity_multiplier",
    "inventory_size_multiplier",
    "cargo_wagon_inventory_size_multiplier",
    "locomotive_power_multiplier",
    "rolling_stock_max_speed_multiplier",
    "lab_research_speed_multiplier",
    "crafting_machine_speed_multiplier",
    "crafting_machine_energy_usage_multiplier",
    "logistic_cell_charging_energy_multiplier",
    "accumulator_capacity_multiplier",
    "flying_robot_max_energy_multiplier",
    "range_multiplier",
    "asteroid_collector_collection_radius_bonus",
    "equipment_grid_width_bonus",
    "equipment_grid_height_bonus",
    "electric_pole_wire_reach_bonus",
    "electric_pole_supply_area_distance_bonus",
    "beacon_supply_area_distance_bonus",
    "mining_drill_mining_radius_bonus",
    "beacon_power_usage_multiplier",
    "mining_drill_resource_drain_multiplier",
    "science_pack_drain_multiplier",
    "module_consumption_multiplier",
    "module_speed_multiplier",
    "module_productivity_multiplier",
    "module_pollution_multiplier",
    "module_quality_multiplier",
    "spoil_ticks_multiplier",
    "logistic_cell_charging_station_count_bonus",
    "beacon_module_slots_bonus",
    "crafting_machine_module_slots_bonus",
    "mining_drill_module_slots_bonus",
    "lab_module_slots_bonus",
}

return { effective = effective, copied_fields = copied_fields }
