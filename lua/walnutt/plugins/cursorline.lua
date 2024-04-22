return {
  "yamatsum/nvim-cursorline",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local cursorline = require("nvim-cursorline")

    cursorline.setup({
      cursorline = { enable = false },
      cursorword = { enable = true, min_length = 3, hl = { underline = true } },
    })
  end,
}
