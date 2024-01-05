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
}
