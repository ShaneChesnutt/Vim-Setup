local dap = require("dap")
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define('DapBreakpoint', { text = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '' })
vim.fn.sign_define('DapLogPoint', { text = '' })
vim.fn.sign_define('DapStopped', { text = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '' })

vim.keymap.set("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>br", "<cmd>lua require('dap').repl.open()<cr>", { desc = "Open dap repl" })
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Debugger continue" })
vim.keymap.set("n", "<F6>", function() require("dap").step_over() end, { desc = "Debugger step over" })
vim.keymap.set("n", "<F7>", function() require("dap").step_into() end, { desc = "Debugger step into" })
vim.keymap.set("n", "<F8>", function() require("dap").step_out() end, { desc = "Debugger step out" })
vim.keymap.set("n", "<F9>", function() require("dap").step_back() end, { desc = "Debugger step back" })

require("cmp").setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
      or require('cmp_dap').is_dap_buffer()
  end
})

require("cmp").setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
  sources = {
    { name = 'dap' },
  }
})

dap.configurations.javascript = {
  {
    name = 'launch process',
    type = 'pwa-node',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = {'<node_internals>/**/*.js'},
  },
  {
    name = 'attach to process',
    type = 'pwa-node',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = {'<node_internals>/**/*.js'},
  },
}

dap.configurations.cucumber = {
  {
    name = 'attach to process',
    type = 'pwa-node',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    protocol = 'inspector',
    console = 'integratedTerminal',
    skipFiles = {'<node_internals>/**/*.js'},
  },
}
