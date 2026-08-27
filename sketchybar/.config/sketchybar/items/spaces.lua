local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local workspace_names = { "I", "B", "T", "1", "2", "3", "4", "5" }
local laptop_display = 1
local workspace_items = {}
local workspace_brackets = {}

for _, workspace_name in ipairs(workspace_names) do
  local space = sbar.add("item", "space." .. workspace_name, {
    position = "left",
    icon = {
      font = { family = settings.font.numbers },
      string = workspace_name,
      padding_left = 15,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 20,
      color = colors.grey,
      highlight_color = colors.white,
      font = "sketchybar-app-font:Regular:16.0",
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
    popup = { background = { border_width = 5, border_color = colors.black } }
  })

  workspace_items[workspace_name] = space

  -- Single item bracket for space items to achieve double border on highlight
  local space_bracket = sbar.add("bracket", { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2
    }
  })
  workspace_brackets[workspace_name] = space_bracket

  -- Padding space
  sbar.add("item", "space.padding." .. workspace_name, {
    position = "left",
    script = "",
    width = settings.group_paddings,
  })

  space:subscribe("mouse.clicked", function()
    sbar.exec("aerospace workspace " .. workspace_name)
  end)
end

local function update_highlight(focused_workspace)
  for _, workspace_name in ipairs(workspace_names) do
    local selected = workspace_name == focused_workspace
    workspace_items[workspace_name]:set({
      icon = { highlight = selected, },
      label = { highlight = selected },
      background = { border_color = selected and colors.black or colors.bg2 }
    })
    workspace_brackets[workspace_name]:set({
      background = { border_color = selected and colors.grey or colors.bg2 }
    })
  end
end

local function update_app_icons()
  for _, workspace_name in ipairs(workspace_names) do
    sbar.exec("aerospace list-windows --workspace " .. workspace_name, function(output)
      local applications = {}
      local application_icons = {}

      for raw_application_name in output:gmatch("%d+%s*|%s*([^|]+)%s*|") do
        local application_name = raw_application_name:gsub("^%s+", ""):gsub("%s+$", "")
        if not applications[application_name] then
          applications[application_name] = true
          table.insert(application_icons, app_icons[application_name] or app_icons["Default"])
        end
      end

      workspace_items[workspace_name]:set({ label = table.concat(application_icons, " ") })
    end)
  end
end

local workspace_observer = sbar.add("item", {
  drawing = false,
  updates = true,
})

workspace_observer:subscribe("aerospace_workspace_change", function(env)
  update_highlight(env.FOCUSED_WORKSPACE)
  update_app_icons()
end)

sbar.exec("aerospace list-workspaces --focused", function(output)
  update_highlight(output:gsub("%s+$", ""))
end)
update_app_icons()

local function update_display_assignment()
  sbar.exec("aerospace list-monitors", function(output)
    local external_display = nil
    for display_id, display_name in output:gmatch("(%d+)%s*|%s*([^\r\n]+)") do
      if display_name:match("Built%-in Retina Display") then
        laptop_display = tonumber(display_id)
      elseif external_display == nil then
        external_display = tonumber(display_id)
      end
    end

    for _, workspace_name in ipairs(workspace_names) do
      local display = external_display ~= nil and workspace_name ~= "I" and workspace_name ~= "B" and workspace_name ~= "T"
        and external_display or laptop_display
      workspace_items[workspace_name]:set({ display = display })
      workspace_brackets[workspace_name]:set({ display = display })
    end
  end)
end

workspace_observer:subscribe("display_change", update_display_assignment)
update_display_assignment()

local spaces_indicator = sbar.add("item", {
  padding_left = -3,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = "Spaces",
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  }
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on
  })
end)

spaces_indicator:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = "dynamic" }
    })
  end)
end)

spaces_indicator:subscribe("mouse.exited", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0, }
    })
  end)
end)

spaces_indicator:subscribe("mouse.clicked", function(env)
  sbar.trigger("swap_menus_and_spaces")
end)
