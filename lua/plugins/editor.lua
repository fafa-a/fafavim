return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "float",
      },
      follow_current_file = {
        enabled = false, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
  {
    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    {
      "L3MON4D3/LuaSnip",
      keys = function()
        return {}
      end,
    },
    -- then: setup supertab in cmp
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-emoji",
      },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local luasnip = require("luasnip")
        local cmp = require("cmp")
        -- opts.completion = { autocomplete = false }

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end,
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      numhl = true,
      signcolumn = false,
      -- signs = {
      --   add = {
      --     hl = "GitSignsAdd",
      --     text = "",
      --     numhl = "GitSignsAddNr",
      --     linehl = "GitSignsAddLn",
      --   },
      --   change = {
      --     hl = "GitSignsChange",
      --     text = "ﰣ",
      --     numhl = "GitSignsChangeNr",
      --     linehl = "GitSignsChangeLn",
      --   },
      --   delete = {
      --     hl = "GitSignsDelete",
      --     text = "",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      --   topdelete = {
      --     hl = "GitSignsDelete",
      --     text = "",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      --   changedelete = {
      --     hl = "GitSignsChange",
      --     text = "ﰣ",
      --     numhl = "GitSignsChangeNr",
      --     linehl = "GitSignsChangeLn",
      --   },
      -- },
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon file",
      },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "javascript",
        "javascriptreact",
        html = {
          mode = "foreground",
        },
        "lua",
        "vim",
        "typescript",
        "typescriptreact",
        "json",
        "rust",
      })
    end,
  },
  {
    "cjodo/convert.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>cn", "<cmd>ConvertFindNext<CR>", { desc = "Find next convertable unit" })
      vim.keymap.set(
        "n",
        "<leader>cc",
        "<cmd>ConvertFindCurrent<CR>",
        { desc = "Find convertable unit in current line" }
      )
    end,
  },
  -- {
  --      "lewis6991/hover.nvim",
  --      config = function()
  --          require("hover").setup {
  --              init = function()
  --                  -- Require providers
  --                  require("hover.providers.lsp")
  --                  -- require('hover.providers.gh')
  --                  -- require('hover.providers.gh_user')
  --                  -- require('hover.providers.jira')
  --                  -- require('hover.providers.dap')
  --                  -- require('hover.providers.man')
  --                  -- require('hover.providers.dictionary')
  --              end,
  --              preview_opts = {
  --                  border = 'single'
  --              },
  --              -- Whether the contents of a currently open hover window should be moved
  --              -- to a :h preview-window when pressing the hover keymap.
  --              preview_window = false,
  --              title = true,
  --              mouse_providers = {
  --                  'LSP'
  --              },
  --              mouse_delay = 1000
  --          }
  --
  --          -- Setup keymaps
  --          vim.keymap.set("n", "KK", require("hover").hover, {desc = "hover.nvim"})
  --          vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
  --          vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
  --          vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
  --
  --          -- Mouse support
  --          vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
  --          vim.o.mousemoveevent = true
  --      end
  --  }
}
