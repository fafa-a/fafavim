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

-- Do not copy on paste
map("v", "p", '"_dP')

-- Do not copy on delete
-- map({ "n", "v" }, "d", '"_d')

-- Stay in visual mode after indenting with < or >
map("v", ">", ">gv")
map("v", "<", "<gv")

-- show the parsed syntax tree
map("n", "<leader>it", ":InspectTree<CR>", { desc = "Show parsed syntax tree" })

-- toggle js docs
vim.api.nvim_set_keymap("n", "<leader>zd", ":ToggleAllJSDocFolds<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ce", "", {
  callback = function()
    require("codecompanion").prompt("explain")
  end,
  noremap = true,
  silent = true,
})

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
