-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_set_hl(0, "CursorReset", { bg = "#c4c3c5", fg = "#ffffff" })

vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=n-v-c:block,i-ci-ve:ver100/,a:blinkwait700-blinkoff400-blinkon250-CursorReset/lCursorReset
  augroup END
]])
