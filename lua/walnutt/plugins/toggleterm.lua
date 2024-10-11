return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = "curved",
      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
      width = function()
        return math.ceil(vim.o.columns * 0.85)
      end,
      height = function()
        return math.ceil(vim.o.lines * 0.85)
      end,
      winblend = 20,
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
