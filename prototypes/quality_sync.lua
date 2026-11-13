-- Mods that set a multiplier on every quality by its level in data-updates (Muluna: science_pack_drain_multiplier =
-- 1 / (1 + 0.3 * level)) give Void quality a value the quality before it does not have. Void quality keeps the values
-- of that quality (legendary in vanilla) apart from the science multipliers, so they are copied again here.

local fields = require("prototypes.quality_fields")

local void = data.raw.quality and data.raw.quality["voidp-void"]
if not void then
    return
end

local previous
for _, quality in pairs(data.raw.quality) do
    if quality.next == "voidp-void" then
        previous = quality
    end
end
if not previous then
    log("VoidProcessing-Updated: no quality leads to Void quality any more, its values are left as they are")
    return
end

for _, field in ipairs(fields.copied_fields) do
    local value = fields.effective(previous, field)
    if void[field] ~= value then
        log(("VoidProcessing-Updated: Void quality %s %s -> %s, as %s"):format(field, tostring(void[field]), tostring(value),
            previous.name))
        void[field] = value
    end
end

for _, field in ipairs({ "tool_durability_multiplier", "science_capacity_multiplier" }) do
    if void[field] ~= 10 then
        log(("VoidProcessing-Updated: Void quality %s %s -> 10"):format(field, tostring(void[field])))
        void[field] = 10
    end
end
