local items = require("prototypes.void_learning.learnable")()
require("prototypes.void_learning.disks")(items)
local recipes = require("prototypes.void_learning.recipes")(items)
require("prototypes.void_learning.effects")(recipes)
return { items = items, recipes = recipes }
