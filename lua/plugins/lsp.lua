return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
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
