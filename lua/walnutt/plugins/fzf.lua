return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    -- calling `setup` is optional for customization
    fzf.setup({
      winopts = {
        preview = {
          vertical = "up:65%",
          layout = "vertical",
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf: Find Files" })
    keymap.set(
      "n",
      "<leader>fg",
      fzf.git_files,
      { desc = "fzf: Search Git Files" }
    )
    keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "fzf: Live Grep" })
    keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fzf: Search Buffers" })
    keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "fzf: Search Word" })
    keymap.set("n", "<leader>fc", fzf.git_status, { desc = "fzf: Git Status" })
  end,
}
