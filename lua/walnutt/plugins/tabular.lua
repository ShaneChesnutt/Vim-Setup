return {
  "godlygeek/tabular",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Align Pipes
    vim.keymap.set("n", "<leader>t|", ":Tab/|<CR>")
  end,
}
