return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>aa", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          rustfmt = {
            overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
          },
        },
      },
    },
  },
}
