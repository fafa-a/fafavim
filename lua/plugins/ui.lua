return {
  {
    "tzachar/highlight-undo.nvim",
    opts = {},
    config = function()
      require("highlight-undo").setup({})
    end,
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
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
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
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      lsp = {
        documentation = {
          view = "hover",
          opts = { -- lsp_docs settings
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            position = { row = 2, col = 2 },
            size = {
              max_width = math.floor(0.6 * vim.api.nvim_win_get_width(0)),
              max_height = 15,
            },
            border = {
              style = "rounded",
            },
            win_options = {
              concealcursor = "n",
              conceallevel = 3,
              winhighlight = {
                Normal = "NormalFloat",
                FloatBorder = "FloatBorder",
              },
            },
          },
        },
      },
    },
  },
}
