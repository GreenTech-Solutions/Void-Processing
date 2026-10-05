-- Before 2.1.1 the void data disk recipes were enabled from the start. Now technologies unlock them,
-- so in older saves a force keeps a recipe only if it has researched a technology that unlocks it.
for _, recipe_name in pairs({ "void-data-disk", "void-data-disk-black-hole" }) do
    local unlocked_by = {}
    for technology_name, technology in pairs(prototypes.technology) do
        for _, effect in pairs(technology.effects) do
            if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
                table.insert(unlocked_by, technology_name)
            end
        end
    end

    for _, force in pairs(game.forces) do
        local recipe = force.recipes[recipe_name]
        if recipe then
            local researched = false
            for _, technology_name in pairs(unlocked_by) do
                if force.technologies[technology_name].researched then
                    researched = true
                end
            end
            recipe.enabled = researched
        end
    end
end
