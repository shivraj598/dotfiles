local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the native event provider which reports used RAM every 2.0 seconds.
sbar.exec("killall ram_load >/dev/null; $CONFIG_DIR/helpers/event_providers/ram_load/bin/ram_load ram_update 2.0")

local ram = sbar.add("item", "widgets.ram", {
  position = "right",
  icon = { string = icons.ram },
  label = {
    string = "ram ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 9.0,
    },
    padding_right = 0,
    y_offset = 4,
  },
  padding_right = settings.paddings + 6,
})

ram:subscribe("ram_update", function(env)
  ram:set({ label = "ram " .. env.ram_usage .. "%" })
end)

ram:subscribe("mouse.clicked", function()
  sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("bracket", "widgets.ram.bracket", { ram.name }, {
  background = { color = colors.bg1 }
})

sbar.add("item", "widgets.ram.padding", {
  position = "right",
  width = settings.group_paddings,
})