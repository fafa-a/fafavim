return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "anthropic",
          keymaps = {
            hide = {
              modes = {
                n = "<C-h>",
                i = "<C-h>",
              },
              callback = function(chat)
                chat.ui:hide()
              end,
              description = "Hide the chat buffer",
            },
            close = {
              modes = {
                n = "<C-x>",
                v = "<C-x>",
              },
              callback = "keymaps.close",
              description = "Close Chat",
            },
          },
        },
        inline = {
          adapter = "anthropic",
        },
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = os.getenv("ANTHROPIC_API_KEY"),
            },
          })
        end,
      },
    })
  end,
}
