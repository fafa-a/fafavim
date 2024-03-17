local function check_prettier_config(bufnr)
  local prettier_configs = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.js",
    "prettier.config.js",
  }
  for _, config_file in ipairs(prettier_configs) do
    if vim.fn.filereadable(config_file) == 1 then
      return { "prettierd", "prettier" }
    end
  end
  return { "biome" }
end

local prettier_svelte =
  vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/prettier/node_modules/prettier-plugin-svelte/plugin.js")

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      svelte_fmt = {
        command = "prettier",
        args = { "--plugin", prettier_svelte, "$FILENAME" },
      },
    },
    formatters_by_ft = {
      javascript = function(bufnr)
        return check_prettier_config(bufnr)
      end,
      javascriptreact = function(bufnr)
        return check_prettier_config(bufnr)
      end,
      typescript = function(bufnr)
        return check_prettier_config(bufnr)
      end,
      typescriptreact = function(bufnr)
        return check_prettier_config(bufnr)
      end,
      json = function(bufnr)
        return check_prettier_config(bufnr)
      end,
      svelte = { "svelte_fmt" },
    },
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
  },
}
