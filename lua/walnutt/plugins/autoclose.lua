return {
  "m4xshen/autoclose.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("autoclose").setup()
  end,
}
