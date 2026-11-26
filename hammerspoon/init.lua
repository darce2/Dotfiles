hs.loadSpoon("ShiftIt")

local mash = { "ctrl", "alt", "cmd" }

spoon.ShiftIt:bindHotkeys({
  left = { mash, "h" },
  down = { mash, "j" },
  up = { mash, "k" },
  right = { mash, "l" },
})
