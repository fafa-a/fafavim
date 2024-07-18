-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_set_hl(0, "CursorReset", { bg = "#A17EE6", fg = "#FBF9FF" })
--
-- vim.cmd([[
--   augroup RestoreCursorShapeOnExit
--     autocmd!
--     autocmd VimLeave * set guicursor=n-v-c:block,i-ci-ve:ver100/,a:blinkwait700-blinkoff400-blinkon250-CursorReset/lCursorReset
--   augroup END
-- ]])

-- Disable autoformat for all files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
    vim.wo.spell = false
  end,
})

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gleam", "typescript", "typescriptreact" },
  callback = function()
    vim.b.autoformat = true
    local bufnr = vim.api.nvim_get_current_buf()
    local client = vim.lsp.get_active_clients({ bufnr = bufnr })[1]
    if not client then
      local filetype = vim.bo.filetype
      local lsp_config = require("lspconfig")

      if filetype == "gleam" and lsp_config.gleam then
        lsp_config.gleam.setup({})
      elseif (filetype == "typescript" or filetype == "typescriptreact") and lsp_config.vtsls then
        lsp_config.vtsls.setup({})

        if file_exists("biome.json") then
          lsp_config.biome.setup({})
        elseif file_exists(".eslintrc.js") or file_exists(".eslintrc.json") or file_exists(".eslintrc") then
          lsp_config.eslint.setup({})
        end

        if file_exists(".prettierrc") or file_exists(".prettierrc.js") or file_exists(".prettierrc.json") then
          lsp_config.prettier.setup({})
        end
      end

      vim.lsp.buf_attach_client(bufnr, 0)
    end
  end,
})
