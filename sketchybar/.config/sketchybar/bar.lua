local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 32,
  color = colors.bar.bg,
  padding_right = 0,
  padding_left = 0,
  -- Transparent 10px gap around the bar (no background drawn in the margin)
  margin = 10,
  corner_radius = 9,
})

