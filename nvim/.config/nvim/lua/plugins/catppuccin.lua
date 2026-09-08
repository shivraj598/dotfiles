return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
  {
    "catppuccin",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "catppuccin",
        callback = function()
          for _, group in ipairs({
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "SignColumn",
            "EndOfBuffer",
            "StatusLine",
            "StatusLineNC",
            "SnacksDashboardNormal",
            "SnacksDashboardHeader",
            "SnacksDashboardDesc",
            "SnacksDashboardIcon",
            "SnacksDashboardKey",
            "SnacksDashboardFooter",
            "SnacksDashboardDir",
          }) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
          end
        end,
      })
    end,
    opts = {
      transparent_background = true,
      flavor = "mocha",
      float = { transparent = true, solid = false },
      custom_highlights = function(colors)
        return {
          Normal = { bg = colors.none },
          NormalNC = { bg = colors.none },
          NormalFloat = { bg = colors.none },
          FloatBorder = { bg = colors.none },
          SignColumn = { bg = colors.none },
          EndOfBuffer = { bg = colors.none },
          StatusLine = { bg = colors.none },
          StatusLineNC = { bg = colors.none },
        }
      end,
    },
  },
}
