return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup()

    local keymap = vim.keymap

    keymap.set("n", "<leader>sn", function()
      gitsigns.nav_hunk("next")
    end, { desc = "Gitsigns: Next Hunk" })
    keymap.set("n", "<leader>sp", function()
      gitsigns.nav_hunk("prev")
    end, { desc = "Gitsigns: Previous Hunk" })
  end,
}
