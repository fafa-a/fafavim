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

return {
  "stevearc/conform.nvim",
  opts = {
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
      svelte = function(bufnr)
        return check_prettier_config(bufnr)
      end,
    },
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
  },
}
