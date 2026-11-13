local items = require("prototypes.void_learning.learnable")()
require("prototypes.void_learning.disks")(items)
local recipes = require("prototypes.void_learning.recipes")(items)
-- step 04: technology effects
return { items = items, recipes = recipes }
