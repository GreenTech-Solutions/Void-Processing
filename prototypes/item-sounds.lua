local function item_sound(filename, volume)
  return
  {
    filename = "__VoidProcessing-Updated__/sound/item/" .. filename,
    volume = volume,
    aggregation = { max_count = 1, remove = true },
  }
end

local item_sounds =
{

}

return item_sounds
