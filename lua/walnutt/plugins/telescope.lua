return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      live_grep = {
        file_ignore_patterns = { "node_modules", ".git" },
        hidden = true,
      },
      find_files = {
        file_ignore_patterns = { "node_modules", ".git" },
        hidden = true,
      },
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "Telescope: Find Files" }
    )
    keymap.set(
      "n",
      "<leader>fg",
      builtin.git_files,
      { desc = "Telescope: Search Git Files" }
    )
    keymap.set(
      "n",
      "<leader>fs",
      builtin.live_grep,
      { desc = "Telescope: Live Grep" }
    )
    keymap.set(
      "n",
      "<leader>fb",
      builtin.buffers,
      { desc = "Telescope: Search Buffers" }
    )
    keymap.set(
      "n",
      "<leader>fw",
      builtin.grep_string,
      { desc = "Telescope: Search Word" }
    )
    keymap.set(
      "n",
      "<leader>fc",
      builtin.git_status,
      { desc = "Telescope: Git Status" }
    )
  end,
}
