return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      messages = {
        enabled = false,
      },
    })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>nd",
      "<cmd>NoiceDismiss<CR>",
      { desc = "Noice: Dismiss" }
    )
    keymap.set(
      "n",
      "<leader>nr",
      "<cmd>NoiceDisable<CR><cmd>NoiceEnable<CR>",
      { desc = "Noice: Reset" }
    )
  end,
}
