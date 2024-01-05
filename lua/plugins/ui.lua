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
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
}
