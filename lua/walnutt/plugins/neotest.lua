return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-vim-test",
    },
    keys = {
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Neotest: Run debug",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest: Run file",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Neotest: Run nearest",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Neotest: Toggle output panel",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Neotest: Toggle summary",
      },
      {
        "<leader>tw",
        function()
          require("neotest").run.run({ jestCommand = "jest --watch" })
        end,
        desc = "Neotest: Run watch (jest only)",
      },
    },
    config = function()
      local neotest_jest = require("neotest-jest")({
        jestCommand = "npm test --",
      })
      neotest_jest.filter_dir = function(name)
        return name ~= "node_modules" or name ~= "__snapshots__"
      end

      require("neotest").setup({
        adapters = {
          neotest_jest,
          require("neotest-rspec")({}),
          require("neotest-vim-test")({
            ignore_file_types = { "javascript", "ruby" },
          }),
        },
        status = {
          signs = false,
          virtual_text = true,
        },
        icons = {
          expanded = "",
          child_prefix = "",
          child_indent = "",
          final_child_prefix = "",
          non_collapsible = "",
          collapsed = "",
          passed = "",
          running = "",
          failed = "",
          unknown = "",
        },
      })
    end,
  },
}
