local discipline = require("fafa.discipline")
discipline.cowboy()
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

-- map("i", "<tab>", function()
--   require("copilot.suggestion").accept()
--   -- Put cursor on next line.
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
-- end)
-- Use this to toggle lazygit in a floating terminal

-- local function create_float_term()
--     local width = math.floor(vim.o.columns * 0.9)
--     local height = math.floor(vim.o.lines * 0.9)
--     local buf = vim.api.nvim_create_buf(false, true)
--     local opts = {
--         relative = "editor",
--         width = width,
--         height = height,
--         col = math.floor((vim.o.columns - width) / 2),
--         row = math.floor((vim.o.lines - height) / 2),
--         style = "minimal",
--         border = "rounded"
--     }
--     local win = vim.api.nvim_open_win(buf, true, opts)
--     return buf, win
-- end
--
-- local function open_lazygit()
--     local buf, win = create_float_term()
--
--     vim.fn.termopen("lazygit", {
--         on_exit = function()
--             if vim.api.nvim_buf_is_valid(buf) then
--                 vim.api.nvim_buf_delete(buf, { force = true })
--             end
--             if vim.api.nvim_win_is_valid(win) then
--                 vim.api.nvim_win_close(win, true)
--             end
--         end
--     })
--     vim.cmd('startinsert')
-- end
--
-- vim.api.nvim_create_user_command('LazyGit', open_lazygit, {})
-- vim.api.nvim_set_keymap('n', '<C-g>', ':LazyGit<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<C-/>', ':LazyGitTerminal<CR>', { noremap = true, silent = true })
-- map("n", "<C-g>", function()
--   require('toggleterm').exec('lazygit')
-- end)

-- Do not copy on paste
map("v", "p", '"_dP')

-- Do not copy on delete
-- map({ "n", "v" }, "d", '"_d')

-- Stay in visual mode after indenting with < or >
map("v", ">", ">gv")
map("v", "<", "<gv")

-- show the parsed syntax tree
map("n","<leader>it", ":InspectTree<CR>", { desc = "Show parsed syntax tree" })

-- toggle js docs
vim.api.nvim_set_keymap('n', '<leader>zd', ':ToggleAllJSDocFolds<CR>', {noremap = true, silent = true})
