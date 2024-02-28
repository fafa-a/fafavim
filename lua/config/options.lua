-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.background = "light"
opt.cursorline = true

-- On pressing tab, insert spaces
opt.expandtab = true
-- Show existing tab with 2 spaces width
opt.tabstop = 2
opt.softtabstop = 2

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

vim.g.yui_folds = 'fade'
vim.g.yui_line_numbers = 'fade'
vim.g.yui_comments = 'emphasize'
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
