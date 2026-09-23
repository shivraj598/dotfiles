-- Transparent background fix for catppuccin + LazyVim
-- catppuccin's `transparent_background` clears `Normal`, but sidebars,
-- floats, and LazyVim plugins (snacks explorer, neo-tree, telescope,
-- noice, which-key, lazy, mason, trouble...) re-set their own backgrounds.
-- This re-clears them on every colorscheme change, which is what makes
-- the terminal (ghostty with background-opacity) show through
-- when a project / explorer is open.
local function set_transparent()
  local groups = {
    -- core editor
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "SignColumn",
    "EndOfBuffer",
    "LineNr",
    "CursorLineNr",
    "Folded",
    "WinSeparator",
    "VertSplit",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "Pmenu",
    "PmenuSel",
    "CursorLine",
    "CursorColumn",
    -- neo-tree / nvim-tree (file explorer)
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator",
    "NeoTreeFloatBorder",
    "NeoTreeFloatTitle",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer",
    "NvimTreeWinSeparator",
    -- snacks (explorer, picker, dashboard, notifier)
    "SnacksNormal",
    "SnacksNormalNC",
    "SnacksWinBar",
    "SnacksPicker",
    "SnacksPickerBorder",
    "SnacksPickerTitle",
    "SnacksDashboardNormal",
    "SnacksNotifierHistory",
    -- telescope / fzf
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopeResultsNormal",
    "TelescopePreviewNormal",
    -- misc floats
    "WhichKeyFloat",
    "LazyNormal",
    "MasonNormal",
    "TroubleNormal",
    "NoiceNormal",
    "NotifyBackground",
  }
  for _, g in ipairs(groups) do
    pcall(vim.api.nvim_set_hl, 0, g, { bg = "NONE", ctermbg = "NONE" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- let the colorscheme finish applying first
    vim.schedule(set_transparent)
  end,
  desc = "Force transparent background after colorscheme",
})

-- fallback for startup ordering (colorscheme may load before this file)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(set_transparent)
  end,
  desc = "Force transparent background on enter",
})

-- apply right now too (e.g. :source, :ColorScheme reload)
set_transparent()
