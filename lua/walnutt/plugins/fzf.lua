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

    keymap.set("n", "<leader>ff", fzf.files, { desc = "fzf: Find files" })
    keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "fzf: Live grep" })
    keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fzf: Search buffers" })
    keymap.set(
      "v",
      "<leader>fv",
      fzf.grep_visual,
      { desc = "fzf: Seach visual selection" }
    )
    keymap.set(
      { "n", "v" },
      "<leader>fw",
      fzf.grep_cword,
      { desc = "fzf: Search word" }
    )
    keymap.set(
      "n",
      "<leader>fr",
      "<cmd>FzfLua grep resume=true<CR>",
      { desc = "fzf: Resume search" }
    )
    keymap.set("n", "<leader>gs", fzf.git_status, { desc = "fzf: Git status" })
    keymap.set("n", "<leader>gf", fzf.git_files, { desc = "fzf: Git files" })
    keymap.set(
      "n",
      "<leader>gc",
      fzf.git_commits,
      { desc = "fzf: Git commits" }
    )
    keymap.set(
      "n",
      "<leader>sc",
      fzf.spell_suggest,
      { desc = "fzf: Spelling suggestions" }
    )
    keymap.set(
      "n",
      "<leader>bl",
      fzf.blines,
      { desc = "fzf: Search all buffers" }
    )
  end,
}
