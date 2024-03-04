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
        opts.completion = { autocomplete = false }

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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
        settings = {
          save_on_toggle = true,
        },
      })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end, { noremap = true, silent = true, desc = "[harpoon] append" })
      vim.keymap.set("n", "<leader>hm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { noremap = true, silent = true, desc = "[harpoon] menu" })

      vim.keymap.set("n", "[h", function()
        harpoon:list():prev()
      end, { noremap = true, silent = true, desc = "[harpoon] previous" })
      vim.keymap.set("n", "]h", function()
        harpoon:list():next()
      end, { noremap = true, silent = true, desc = "[harpoon] next" })
      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(1)
      end, { noremap = true, silent = true, desc = "[harpoon] select 1" })
      vim.keymap.set("n", "<leader>h2", function()
        harpoon:list():select(2)
      end, { noremap = true, silent = true, desc = "[harpoon] select 2" })
      vim.keymap.set("n", "<leader>h3", function()
        harpoon:list():select(3)
      end, { noremap = true, silent = true, desc = "[harpoon] select 3" })
      vim.keymap.set("n", "<leader>h4", function()
        harpoon:list():select(4)
      end, { noremap = true, silent = true, desc = "[harpoon] select 4" })
    end,
  },
  { "lewis6991/gitsigns.nvim", event = "LazyFile", opts = {
    numhl = true,
  } },
}
