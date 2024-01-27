-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.background = "light"
opt.cursorline = true

-- set back up and swap file directory
opt.swapfile = false
-- opt.backup = false
local home = os.getenv("HOME")
local backupDir = home .. "/.nvim/tmp/"
vim.opt.directory = backupDir
opt.undofile = true

-- doom-one colorscheme
-- Add color to cursor
vim.g.doom_one_cursor_coloring = true
-- Set :terminal colors
vim.g.doom_one_terminal_colors = true
-- Enable italic comments
-- vim.g.doom_one_italic_comments = false
-- Enable TS support
-- vim.g.doom_one_enable_treesitter = true
-- Color whole diagnostic text or only underline
-- vim.g.doom_one_diagnostics_text_color = false
-- Enable transparent background
-- vim.g.doom_one_transparent_background = false

-- vimwiki
opt.compatible = false
vim.api.nvim_set_var("filetype", "plugin")
vim.cmd("syntax on")
vim.g.vimwiki_list = {
  {
    path = "~/Documents/notes/",
    syntax = "markdown",
    ext = ".md",
  },
}
