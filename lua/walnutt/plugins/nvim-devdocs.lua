return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>df",
      "<cmd>DevdocsFetch<CR>",
      desc = "Devdocs: Fetch docs",
    },
    {
      "<leader>do",
      "<cmd>DevdocsOpen<CR>",
      desc = "Devdocs: Open docs",
    },
    {
      "<leader>dc",
      "<cmd>DevdocsOpenCurrent<CR>",
      desc = "Devdocs: Open current docs",
    },
    {
      "<leader>dt",
      "<cmd>DevdocsToggle<CR>",
      desc = "Devdocs: Toggle docs",
    },
    {
      "<leader>di",
      "<cmd>DevdocsInstall<CR>",
      desc = "Devdocs: Install docs",
    },
    {
      "<leader>du",
      "<cmd>DevdocsUpdate<CR>",
      desc = "Devdocs: Update docs",
    },
    {
      "<leader>da",
      "<cmd>DevdocsUpdateAll<CR>",
      desc = "Devdocs: Update all docs",
    },
  },
  opts = {
    previewer_cmd = "glow",
    cmd_args = { "-s", "dark", "-w", "80" },
    picker_cmd = "glow",
    picker_cmd_args = { "-s", "dark", "-w", "80" },
  },
}
