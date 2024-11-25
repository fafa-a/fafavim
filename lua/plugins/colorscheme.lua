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

  { "M1nts02/akane.nvim", priority = 1000 },
  { "owickstrom/vim-colors-paramount" },
  { "stefanvanburen/rams.vim" },
  { "cideM/yui" },
  { "scolsen/bernhard" },
  {
    -- dir = os.getenv("HOME") .. (os.getenv("HOME") == "/home/fafa" and "/code/anoukis" or "/Dev/anoukis"),
    "fafa-a/anoukis",
    priority = 1000,
    lazy = false,
    opts = {
      transparent_background = true,
      color_background = "light", --"light","dark"
      diagnostic_background = false,
      variants = "purple", --"purple" , "gray" | "red" | "orange" | "yellow" | "green" | "cyan" | "blue" | "rose""
      -- styles = {
      --     comments = { "italic" },
      --     conditionals = {},
      --     functions = { "bold" },
      --     keywords = {},
      --     strings = { "italic" },
      --     variables = {},
      --     numbers = {},
      --     booleans = {},
      --     types =  {} ,
      --     operators = {},
      -- },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "anoukis",
    },
  },
}
