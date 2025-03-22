return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup({
      options = { cursorline = true },
      styles = {
        types = "NONE",
        methods = "bold",
        numbers = "NONE",
        strings = "italic",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "NONE",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "NONE",
      },
    })

    vim.cmd("colorscheme onedark")
  end,
}
