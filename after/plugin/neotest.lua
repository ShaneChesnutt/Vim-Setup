local neotest = require('neotest')

local neotest_jest = require('neotest-jest')({ jestCommand = 'npm test --' })
neotest_jest.filter_dir = function(name)
  return name ~= 'node_modules' and name ~= '__snapshots__'
end

neotest.setup(
  {
    adapter = { neotest_jest, require('neotest-rspec') },
    status = { signs = false, virtual_text = true },
    icons = {
      expanded = '',
      child_prefix = '',
      child_indent = '',
      final_child_prefix = '',
      non_collapsible = '',
      collapsed = '',
      passed = '',
      running = '',
      failed = '',
      unknown = ''
    }
  }
)

-- Keymappings
vim.api.nvim_set_keymap(
  'n', '<leader>tw',
  '<cmd>lua require(\'neotest\').run.run({ jestCommand = \'jest --watch \' })<cr>',
  {}
)
vim.api.nvim_set_keymap(
  'n', '<leader>tf',
  '<cmd>lua require(\'neotest\').run.run(vim.fn.expand(\'%\'))<cr>', {}
)
vim.api.nvim_set_keymap(
  'n', '<leader>tn', '<cmd>lua require(\'neotest\').run.run()<cr>', {}
)
vim.api.nvim_set_keymap(
  'n', '<leader>td',
  '<cmd>lua require(\'neotest\').run.run({ strategy = \'dap\' })<cr>', {}
)
vim.api.nvim_set_keymap(
  'n', '<leader>ts', '<cmd>lua require(\'neotest\').summary.toggle()<cr>', {}
)
vim.api.nvim_set_keymap(
  'n', '<leader>to', '<cmd>lua require(\'neotest\').output_panel.toggle()<cr>',
  {}
)
