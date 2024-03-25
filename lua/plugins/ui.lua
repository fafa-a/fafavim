return {
  {
    "folke/noice.nvim",
    opts = {
      presets = { lsp_doc_border = true },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

        ███████╗ █████╗ ███████╗ █████╗ ██╗   ██╗██╗███╗   ███╗
        ██╔════╝██╔══██╗██╔════╝██╔══██╗██║   ██║██║████╗ ████║
        █████╗  ███████║█████╗  ███████║██║   ██║██║██╔████╔██║
        ██╔══╝  ██╔══██║██╔══╝  ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║     ██║  ██║██║     ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    opts = {},
    config = function()
      require("highlight-undo").setup({})
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.cursor = {
        enable = false,
      }
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = {
  --     theme = "monokai-nightasty",
  --   },
  -- },
  {
    "numToStr/FTerm.nvim",
    keys = {
      { "<A-`>", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Open terminal" },
      { "<A-`>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Close terminal" },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win) end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function() end,
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- lazy = true,
    config = function()
      require("bufferline").setup({
        highlights = require("anoukis.plugins.bufferline").setup(),
      })
    end,
  },
}
