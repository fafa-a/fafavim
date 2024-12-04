-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for all files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
    vim.wo.spell = false
  end,
})

-- handle JSDoc
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript,typescript,javascriptreact,typescriptreact",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "getline(v:lnum)=~'^\\s*/\\*\\*' ? '>1' : getline(v:lnum)=~'^\\s*\\*/' ? '<1' : '='"
    vim.opt_local.foldenable = false -- Start with folds open
  end,
})

-- Function to toggle all JSDoc folds
local function toggle_all_jsdoc_folds()
  local win = vim.api.nvim_get_current_win()
  local cursor_pos = vim.api.nvim_win_get_cursor(win)

  -- Toggle foldenable
  vim.wo.foldenable = not vim.wo.foldenable

  if vim.wo.foldenable then
    -- If enabling folds, close all JSDoc folds
    vim.cmd([[silent! %g/^\s*\/\*\*/normal! zc]])
  end

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(win, cursor_pos)
  vim.cmd("nohlsearch")
  print(vim.wo.foldenable and "All JSDoc folds closed" or "All JSDoc folds opened")
end

-- Create a command to toggle all JSDoc folds
vim.api.nvim_create_user_command("ToggleAllJSDocFolds", toggle_all_jsdoc_folds, {})
