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
    },
    -- Set the log level
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
  },
}

function check_prettier_config(bufnr)
  local prettier_configs = { ".prettierrc", ".prettierrc.json", ".prettierrc.yaml", ".prettierrc.yml", ".prettierrc.js", "prettier.config.js" }
  for _, config_file in ipairs(prettier_configs) do
    if vim.fn.filereadable(config_file) == 1 then
      return { "prettierd", "prettier" }
    end
  end
  return { "biome" }
end
