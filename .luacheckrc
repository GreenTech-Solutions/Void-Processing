-- Runs on top of the base config of factorio-mod-tools (lua/luacheckrc.lua), which sets std, the Factorio globals and
-- allow_defined_top: add to its tables here.
-- data-stage helpers: __base__/prototypes/entity/pipecovers.lua, visible-planets
for _, name in ipairs({ "pipecoverspictures", "vp_override_planet_sprite", "vp_override_planet_scale" }) do
  read_globals[#read_globals + 1] = name
end
