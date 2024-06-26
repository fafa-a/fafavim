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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
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
    keys = {
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code", mode = { "n", "v" } },
      {
        "<leader>af",
        "<cmd>CopilotChatFixDiagnostic<cr>",
        desc = "CopilotChat - Fix diagnostic",
        mode = { "n", "v" },
      },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize", mode = { "n", "v" } },
      -- { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      -- { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      -- { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      -- { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      -- { "<leader>ccs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      -- { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>", desc = "CopilotChat - Correct spelling" },
      -- { "<leader>ccw", "<cmd>CopilotChatWording<cr>", desc = "CopilotChat - Improve wording" },
      -- { "<leader>ccc", "<cmd>CopilotChatConcise<cr>", desc = "CopilotChat - Make text concise" },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "VeryLazy",
    config = function()
      require("ts-error-translator").setup()
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
