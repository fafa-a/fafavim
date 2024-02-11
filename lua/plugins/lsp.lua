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
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },
}
