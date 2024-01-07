-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- Keymaps for better default experience
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("i", "<C-c>", "<Esc>")

-- indent in visual modes
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

-- moove selected text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- remap vimwiki keymaps conflict with base keymaps
map("n", "<Leader>ow", "<Plug>VimwikiIndex", { silent = true })

map("i", "<tab>", function()
  require("copilot.suggestion").accept()
  -- Put cursor on next line.
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
end)

local fterm = require("FTerm")

local btop = fterm:new({
  ft = "fterm_btop",
  cmd = "btop",
})

local lazygit = fterm:new({
  ft = "fterm_lazygit",
  cmd = "lazygit",
})

-- Use this to toggle btop in a floating terminal
map("n", "<A-b>", function()
  btop:toggle()
end)

-- Use this to toggle lazygit in a floating terminal
map("n", "<A-g>", function()
  lazygit:toggle()
end)
