local lib = require("lib")

local fields = require("prototypes.quality_fields")
local effective, copied_fields = fields.effective, fields.copied_fields

local function find_last_quality(qualities, first)
    local last = first
    local visited = {}

    while last do
        if visited[last.name] then
            break
        end
        visited[last.name] = true

        local next_quality = last.next and qualities[last.next]
        if not next_quality or visited[next_quality.name] then
            break
        end
        last = next_quality
    end

    return last
end

if settings.startup["voidp-final-quality"].value then
    local qualities = data.raw.quality or {}
    local normal = qualities.normal
    if not normal then
        log("VoidProcessing-Updated: quality chain does not contain normal, skipping Void quality")
        return
    end

    local last = find_last_quality(qualities, normal)
    if last.name ~= "legendary" then
        log("VoidProcessing-Updated: the quality chain ends at " .. last.name .. ", Void quality is attached after it")
    end

    local void_quality = {
        type = "quality",
        name = "voidp-void",
        level = last.level + 1,
        order = (last.order or "") .. "-voidp-void",
        subgroup = last.subgroup,
        color = { r = 0.54, g = 0.12, b = 0.80 },
        icon = lib.icon("quality-void"),
        icon_size = 64,
        tool_durability_multiplier = 10,
        science_capacity_multiplier = 10,
    }

    for _, field in ipairs(copied_fields) do
        void_quality[field] = effective(last, field)
    end

    last.next = "voidp-void"
    last.next_probability = 0
    data:extend({ void_quality })
end
