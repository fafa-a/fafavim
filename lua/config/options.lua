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

vim.g.root_spec = { "cwd" }

-- Set up folding options
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldmethod = "expr"
-- vim.wo.foldminlines = 1
-- vim.wo.foldnestmax = 3
