-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Press jk in Insert mode to return to Normal mode.
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
