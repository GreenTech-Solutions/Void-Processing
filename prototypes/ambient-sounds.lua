if not settings.startup["disable-new-music"].value then
    data:extend({
        {
            -- Density by RustyNova
            type = "ambient-sound",
            name = "void-processing-1",
            track_type = "main-track",
            sound = "__VoidProcessing-Updated__/sounds/ambient/Density.ogg",
            weight = 10
        },

    })
end
