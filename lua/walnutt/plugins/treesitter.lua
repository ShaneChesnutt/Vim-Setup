return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      modules = {},
      ensure_installed = {
        "c",
        "javascript",
        "lua",
        "embedded_template",
        "ruby",
        "vim",
        "bash",
        "css",
        "dockerfile",
        "html",
        "json",
        "markdown",
        "markdown_inline",
        "prisma",
        "tsx",
        "ruby",
        "typescript",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
