return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } },
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
    },
    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          vertical = {
            size = {
              width = "90%",
              height = "90%",
            },
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
