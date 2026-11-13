-- Void quality is reached only by disk ascension. A product with quality_change > 0 and no quality_max goes past the
-- end of the chain (a legendary ingredient gives a Void product once the force has unlocked Void quality), and so does
-- an item that spoils into a higher quality. Their maximum is set to the quality before Void (legendary in vanilla).
-- A quality_max another mod set, Void included, is left as it is.
-- Recipes of other mods with a fixed Void product (quality_min = Void, for example a recipe built for every step of the
-- quality chain) are hidden and taken out of their technologies; a technology left without effects is hidden too.

local void = data.raw.quality and data.raw.quality["voidp-void"]
if not void then
    return
end

local previous
for _, quality in pairs(data.raw.quality) do
    if quality.next == "voidp-void" then
        previous = quality.name
    end
end
if not previous then
    return
end

local capped_recipes = 0
for _, recipe in pairs(data.raw.recipe) do
    local capped = false
    for _, result in pairs(recipe.results or {}) do
        if result.type == "item" and (result.quality_change or 0) > 0 and result.quality_max == nil then
            result.quality_max = previous
            capped = true
        end
    end
    if capped then
        capped_recipes = capped_recipes + 1
    end
end

local capped_items = {}
for type_name in pairs(defines.prototypes.item) do
    for name, item in pairs(data.raw[type_name] or {}) do
        if (item.spoil_quality_change or 0) > 0 and item.spoil_quality_max == nil then
            item.spoil_quality_max = previous
            table.insert(capped_items, name)
        end
    end
end
table.sort(capped_items)

local void_recipes = {}
for name, recipe in pairs(data.raw.recipe) do
    for _, result in pairs(recipe.results or {}) do
        if result.type == "item" and result.quality_min == void.name then
            void_recipes[name] = true
            recipe.enabled = false
            recipe.hidden = true
            recipe.hidden_in_factoriopedia = true
            log(("VoidProcessing-Updated: recipe %s makes %s at Void quality; hidden"):format(name, result.name))
            break
        end
    end
end

if next(void_recipes) then
    local prerequisite_of = {}
    for _, technology in pairs(data.raw.technology) do
        for _, prerequisite in pairs(technology.prerequisites or {}) do
            prerequisite_of[prerequisite] = true
        end
    end
    for name, technology in pairs(data.raw.technology) do
        local effects = technology.effects
        if effects then
            local removed = false
            for i = #effects, 1, -1 do
                if effects[i].type == "unlock-recipe" and void_recipes[effects[i].recipe] then
                    table.remove(effects, i)
                    removed = true
                end
            end
            if removed then
                if #effects == 0 and not prerequisite_of[name] then
                    technology.hidden = true
                    log(("VoidProcessing-Updated: technology %s has no effects left; hidden"):format(name))
                else
                    log(("VoidProcessing-Updated: technology %s no longer unlocks Void quality recipes"):format(name))
                end
            end
        end
    end
end

log(("VoidProcessing-Updated: quality-raising products capped at %s in %d recipes; spoiling capped for: %s"):format(
    previous, capped_recipes, #capped_items > 0 and table.concat(capped_items, ", ") or "none"))
