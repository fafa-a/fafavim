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
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "monokai-nightasty",
    },
  },
  {
    "numToStr/FTerm.nvim",
    keys = {
      { "`", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Open terminal" },
      { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Close terminal" },
    },
    config = function() end,
  },
}
