local function transparent_theme()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local fg = normal.fg and ("#%06x"):format(normal.fg) or "#c0caf5"

  local function section()
    return { fg = fg, bg = "NONE" }
  end

  return {
    normal = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    insert = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    visual = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    replace = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    command = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    terminal = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
    inactive = { a = section(), b = section(), c = section(), x = section(), y = section(), z = section() },
  }
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = transparent_theme()
      return opts
    end,
  },
}