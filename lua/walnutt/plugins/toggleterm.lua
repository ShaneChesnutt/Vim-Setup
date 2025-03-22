return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    close_on_exit = true,
    start_in_insert = true,
    auto_scroll = true,
    float_opts = {
      border = "curved",
      width = function()
        return math.ceil(vim.o.columns * 0.85)
      end,
      height = function()
        return math.ceil(vim.o.lines * 0.85)
      end,
      title_pos = "center",
    },
  },
  keys = {
    {
      "<f12>",
      "<cmd>ToggleTerm<cr>",
      mode = "n",
      desc = "ToggleTerm: toggle",
    },
    {
      "<f12>",
      "<C-\\><C-n>:ToggleTerm<CR>",
      mode = "t",
      desc = "togglerterm: toggle",
    },
  },
}
