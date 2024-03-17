local function run_command(command)
  local handle = io.popen(command)
  local result = handle:read("a")
  handle:close()
  vim.notify("Command: \n\n" .. command .. "\nResult:" .. result)
end

local function prettier_plugin_svelte_install()
  local prettier_node_modules = vim.fn.resolve(
    vim.fn.stdpath("data") ..
    "/mason/packages/prettier/node_modules/"
  )
  run_command("cd " .. prettier_node_modules .. " && npm install prettier-plugin-svelte")
end

vim.api.nvim_create_user_command("MasonExtraInstall", prettier_plugin_svelte_install, {})

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "biome",
        "css-lsp",
        "luacheck",
        "shellcheck",
        "shfmt",
        "stylua",
        "svelte-language-server",
        "typescript-language-server",
      })
    end,
  },
}
