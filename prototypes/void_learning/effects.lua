local recipe_unlocks = {
    { technology = "void-data-learning", recipes = "learning" },
    { technology = "void-synthesis", recipes = "synthesis" },
    { technology = "void-disk-refining", recipes = "refining" },
}

---@param recipes table<string, string[]>
return function(recipes)
    local function append_recipe_unlocks(technology_name, recipe_names)
        local technology = data.raw.technology[technology_name]
        if not technology then
            log("VoidProcessing-Updated: technology is missing, skipping recipe effects: " .. technology_name)
            return
        end

        technology.effects = technology.effects or {}
        for _, recipe_name in ipairs(recipe_names) do
            table.insert(technology.effects, {
                type = "unlock-recipe",
                recipe = recipe_name,
                hidden = true,
            })
        end
    end

    for _, entry in ipairs(recipe_unlocks) do
        append_recipe_unlocks(entry.technology, recipes[entry.recipes])
    end

    if #recipes.ascension > 0 then
        append_recipe_unlocks("void-quality", recipes.ascension)
    end

    local productivity_technology = data.raw.technology["void-synthesis-productivity"]
    if not productivity_technology then
        log("VoidProcessing-Updated: technology is missing, skipping recipe effects: void-synthesis-productivity")
        return
    end

    productivity_technology.effects = productivity_technology.effects or {}
    for _, recipe_name in ipairs(recipes.synthesis) do
        table.insert(productivity_technology.effects, {
            type = "change-recipe-productivity",
            recipe = recipe_name,
            change = 0.05,
            hidden = true,
        })
    end
end
