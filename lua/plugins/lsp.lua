return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        "luacheck",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
      })
    end,
  },
}
