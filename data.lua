require("prototypes.mod")
require("base-data-updates")

if mods["visible-planets"] then
    vp_override_planet_sprite("black-hole", "__VoidProcessing-Updated__/graphics/visible-planets/black-hole.png", 2048)
    vp_override_planet_scale("black-hole", 2.5)
    vp_override_planet_sprite("black-hole-approach", "__VoidProcessing-Updated__/graphics/visible-planets/black-hole.png", 2048)
    vp_override_planet_scale("black-hole-approach", 0.25)
end

-- Redrawn Space Connections rebuilds all routes from star map positions and would add routes straight to Oratl.
-- Its exclusion flag keeps Oratl's own route, so Oratl is reached only through its approach.
---@class data.SpaceLocationPrototype
---@field redrawn_connections_exclude? boolean read by Redrawn Space Connections

if mods["Redrawn-Space-Connections"] then
    data.raw["space-location"]["black-hole"].redrawn_connections_exclude = true
end
