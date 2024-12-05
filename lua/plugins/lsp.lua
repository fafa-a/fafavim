return {
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
        "typescript-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
    opts = function(_, opts)
      LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "typescript-svelte-plugin",
          location = LazyVim.get_pkg_path("svelte-language-server", "/node_modules/typescript-svelte-plugin"),
          enableForWorkspaceTypeScriptVersions = true,
        },
      })
      local options = {
        ui = {
          wrap_line_after = false, -- wrap the line after this length to avoid the virtual text is too long
          left_kept_space = 3, --- the number of spaces kept on the left side of the virtual text, make sure it enough to custom for each line
          right_kept_space = 3, --- the number of spaces kept on the right side of the virtual text, make sure it enough to custom for each line
          arrow = "  ",
          up_arrow = "  ",
          down_arrow = "  ",
          above = false, -- the virtual text will be displayed above the line
        },
        priority = 0, -- the priority of virtual text
        inline = false,
      }
      local on_attach = function(client, bufnr)
        require("better-diagnostic-virtual-text.api").setup_buf(bufnr, options)
      end

      local lspconfig = require("lspconfig")
      local servers = { "vtsls", "lua_ls", "rust_analyzer" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          on_attach = on_attach,
        })
      end
    end,
  },
}
