return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      view_options = {
        -- Show hidden files
        show_hidden = true,
        is_hidden_file = function(name)
          return vim.startswith(name, ".")
        end,
        is_always_hidden = function()
          return false
        end,
      },
    })
    vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
  end,
}
