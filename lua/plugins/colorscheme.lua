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
    opts = {
      dark_style_background = "transparent", -- default, dark, transparent, #color
      light_style_background = "transparent", -- default, dark, transparent, #color
      color_headers = true, -- Enable header colors for each header level (h1, h2, etc.)
      hl_styles = {
        -- Background styles for sidebars (panels) and floating windows:
        floats = "transparent", -- default, dark, transparent
        sidebars = "transparent", -- default, dark, transparent
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      lualine_style = "light", -- "dark", "lig"
    },
  },
}
