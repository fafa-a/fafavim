return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "VimEnter",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = false,
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<C-j>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<C-]>",
  --           prev = "<C-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         yaml = false,
  --         help = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --       },
  --       copilot_node_command = "node", -- Node.js version must be > 18.x
  --       server_opts_overrides = {},
  --     })
  --   end,
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-j>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-k>",
        },
      })
    end,
  },
  -- {
    -- "CopilotC-Nvim/CopilotChat.nvim",
    -- opts = {
    --   mode = "split", -- newbuffer or split  , default: newbuffer
    --   prompts = {
    --     Explain = "Explain how it works.",
    --     Review = "Review the following code and provide concise suggestions.",
    --     Tests = "Briefly explain how the selected code works, then generate unit tests.",
    --     Refactor = "Refactor the code to improve clarity and readability.",
    --     -- Text related prompts
    --     Summarize = "Please summarize the following text.",
    --     Spelling = "Please correct any grammar and spelling errors in the following text.",
    --     Wording = "Please improve the grammar and wording of the following text.",
    --     Concise = "Please rewrite the following text to make it more concise.",
    --   },
    -- },
    -- build = function()
    --   vim.defer_fn(function()
    --     vim.cmd("UpdateRemotePlugins")
    --     vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
    --   end, 3000)
    -- end,
    -- event = "VeryLazy",
    -- keys = {
    --   { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code", mode = { "n", "v" } },
    --   {
    --     "<leader>af",
    --     "<cmd>CopilotChatFixDiagnostic<cr>",
    --     desc = "CopilotChat - Fix diagnostic",
    --     mode = { "n", "v" },
    --   },
    --   { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize", mode = { "n", "v" } },
      -- { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      -- { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      -- { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      -- { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      -- { "<leader>ccs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      -- { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>", desc = "CopilotChat - Correct spelling" },
      -- { "<leader>ccw", "<cmd>CopilotChatWording<cr>", desc = "CopilotChat - Improve wording" },
      -- { "<leader>ccc", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make text concise" },
    -- },
  -- },
  -- {
  --   "dmmulroy/ts-error-translator.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("ts-error-translator").setup()
  --   end,
  -- },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  {
    {
      "hrsh7th/nvim-cmp",
      version = false, -- last release is way too old
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      -- Not all LSP servers add brackets when completing a function.
      -- To better deal with this, LazyVim adds a custom option to cmp,
      -- that you can configure. For example:
      --
      -- ```lua
      -- opts = {
      --   auto_brackets = { "python" }
      -- }
      -- ```
      opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true
        return {
          auto_brackets = {}, -- configure any filetype to auto add brackets
          completion = {
            completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
          },
          preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
            ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
            ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-CR>"] = function(fallback)
              cmp.abort()
              fallback()
            end,
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
          }, {
            { name = "buffer" },
          }),
          formatting = {
            format = function(entry, item)
              local icons = LazyVim.config.icons.kinds
              if icons[item.kind] then
                item.kind = icons[item.kind] .. item.kind
              end

              local widths = {
                abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
              }

              for key, width in pairs(widths) do
                if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                  item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                end
              end
              require("tailwindcss-colorizer-cmp").formatter(entry, item)
              return item
            end,
          },
          experimental = {
            ghost_text = {
              hl_group = "CmpGhostText",
            },
          },
          sorting = defaults.sorting,
        }
      end,
      main = "lazyvim.util.cmp",
    },
  },
}
