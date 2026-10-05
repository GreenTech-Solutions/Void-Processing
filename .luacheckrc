-- luacheck config for tools/check.sh
std = "lua52"
max_line_length = false
exclude_files = { "node_modules/**" }

-- the mod defines its helpers as globals at the top level of a file
allow_defined_top = true

read_globals = {
  -- Factorio's globals across stages (https://lua-api.factorio.com/latest/auxiliary/libraries.html)
  "mods", "settings", "feature_flags", "defines", "util", "serpent", "log", "localised_print", "table_size",
  "game", "script", "remote", "commands", "rendering", "rcon", "helpers", "prototypes",
  table = { fields = { "deepcopy", "compare" } },
  -- units from __core__/lualib/util.lua
  "grams", "kg", "tons", "second", "minute", "hour", "meter",
  -- data-stage helpers: __base__/prototypes/entity/pipecovers.lua, visible-planets
  "pipecoverspictures", "vp_override_planet_sprite", "vp_override_planet_scale",
}
-- data-stage code writes into data.raw
globals = { "data", "storage" }

