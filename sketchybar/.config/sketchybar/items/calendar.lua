local settings = require("settings")
local colors = require("colors")

-- Edge spacer (zeroed: last widget sits flush at screen edge)
sbar.add("item", { position = "right", width = 0 })

local cal = sbar.add("item", {
  icon = {
    color = colors.white,
    padding_left = 8,
    font = {
      style = settings.font.style_map["Black"],
      size = 12.0,
    },
  },
  label = {
    color = colors.white,
    padding_right = 8,
    width = 49,
    align = "right",
    font = { family = settings.font.numbers },
  },
  position = "right",
  update_freq = 30,
  -- Same geometry as the workspace pills: bracket height 30 = 26 + 2 * padding 2,
  -- inner radius 5 = bracket radius 7 - 2, no inner border.
  padding_left = 2,
  padding_right = 2,
  background = {
    color = colors.bg2,
    height = 26,
    border_width = 0,
    corner_radius = 5,
  },
  click_script = "open -a 'Calendar'"
})

-- Double border for calendar using a single item bracket
sbar.add("bracket", { cal.name }, {
  background = {
    color = colors.transparent,
    height = 30,
    border_color = colors.purple_soft,
    corner_radius = 7,
  }
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
  cal:set({ icon = os.date("%a. %d %b."), label = os.date("%H:%M") })
end)
