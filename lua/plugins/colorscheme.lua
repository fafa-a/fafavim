return {
  {
    "catppuccin/nvim",
    as = "catpuccin",
    config = function()
      local catppuccin = require("catppuccin")

      catppuccin.setup({
        flavour = "latte",
        transparent_background = true,
      })
    end,
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    priority = 1000,
    keys = {
      { "<leader>tt", "<cmd>MonokaiToggleLight<cr>", desc = "Monokai-Nightasty: Toggle dark/light theme." },
    },
    opts = {
      dark_style_background = "default", -- default, dark, transparent, #color
      light_style_background = "default", -- default, dark, transparent, #color
      terminal_colors = true, -- Set the colors used when opening a `:terminal`
      color_headers = false, -- Enable header colors for each header level (h1, h2, etc.)
      hl_styles = {
        -- Style to be applied to different syntax groups. See `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles for sidebars (panels) and floating windows:
        floats = "transparent", -- default, dark, transparent
        sidebars = "transparent", -- default, dark, transparent
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`

      hide_inactive_statusline = false, -- Hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows
      lualine_bold = true, -- Lualine headers will be bold or regular.
      lualine_style = "light", -- "dark", "lig"
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.border = colors.grey
        colors.comment = "#2d7e79"
      end,

      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        highlights.TelescopeNormal = { fg = colors.magenta, bg = colors.charcoal }
        highlights.WinSeparator = { fg = colors.grey }
      end,
    },
  },
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
  { "rakr/vim-one" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}
