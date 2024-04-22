return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/cmp-dap",
    "hrsh7th/nvim-cmp",
    "mxsdev/nvim-dap-vscode-js",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local dap = require("dap")
    local virtual_text = require("nvim-dap-virtual-text")
    local cmp_dap = require("cmp_dap")

    virtual_text.setup()

    vim.fn.sign_define("DapBreakpoint", { text = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "" })
    vim.fn.sign_define("DapLogPoint", { text = "" })
    vim.fn.sign_define("DapStopped", { text = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "" })

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>b",
      "<cmd>lua require('dap').toggle_breakpoint()<cr>",
      {}
    )
    keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", {})
    keymap.set("n", "<leader>br", "<cmd>lua require('dap').repl.open()<cr>", {})
    keymap.set("n", "<F5>", function()
      dap.continue()
    end)
    keymap.set("n", "<F6>", function()
      dap.step_over()
    end)
    keymap.set("n", "<F7>", function()
      dap.step_into()
    end)
    keymap.set("n", "<F8>", function()
      dap.step_out()
    end)
    keymap.set("n", "<F9>", function()
      dap.step_back()
    end)

    require("cmp").setup({
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
          or cmp_dap.is_dap_buffer()
      end,
    })

    require("cmp").setup.filetype(
      { "dap-repl", "dapui_watches", "dapui_hover" },
      { sources = { { name = "dap" } } }
    )

    dap.configurations.javascript = {
      {
        name = "launch process",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        protocol = "inspector",
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**/*.js" },
      },
      {
        name = "attach to process",
        type = "pwa-node",
        request = "attach",
        cwd = vim.fn.getcwd(),
        protocol = "inspector",
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**/*.js" },
      },
    }

    dap.configurations.cucumber = {
      {
        name = "attach to process",
        type = "pwa-node",
        request = "attach",
        cwd = vim.fn.getcwd(),
        protocol = "inspector",
        console = "integratedTerminal",
        skipFiles = { "<node_internals>/**/*.js" },
      },
    }
  end,
}
