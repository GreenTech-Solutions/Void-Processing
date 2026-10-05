local lib = require("framework.mod")

-- Fix planet lib's adding Void science to promethium.
-- Another mod can turn the technology into a research trigger, which has no unit.
local technology = data.raw["technology"]["promethium-science-pack"]
if technology and technology.unit then
    local sciences = {}
    for _, pack in pairs(technology.unit.ingredients) do
        if pack[1] ~= lib.prefix("void-science-pack") then
            table.insert(sciences, pack)
        end
    end
    technology.unit.ingredients = sciences
end
