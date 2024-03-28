require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case'
    }
  }
}

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set(
  'n', '<leader>fj', builtin.find_files, { desc = 'Telescope: Find Files' }
)
vim.keymap.set(
  'n', '<leader>fg', builtin.git_files, { desc = 'Telescope: Search Git Files' }
)
vim.keymap.set(
  'n', '<leader>fs', builtin.live_grep, { desc = 'Telescope: Live Grep' }
)
vim.keymap.set(
  'n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Seach Buffers' }
)
vim.keymap.set(
  'n', '<leader>fd', builtin.lsp_definitions,
  { desc = 'Telescope: LSP Definitions' }
)
vim.keymap.set(
  'n', '<leader>fi', builtin.lsp_implementations,
  { desc = 'Telescope: LSP Implementations' }
)
vim.keymap.set(
  'n', '<leader>ft', builtin.lsp_type_definitions,
  { desc = 'Telescope: LSP Type Definitions' }
)
vim.keymap.set(
  'n', '<leader>fr', builtin.lsp_references,
  { desc = 'Telescope: LSP References' }
)
vim.keymap.set(
  'n', '<leader>ld', builtin.diagnostics,
  { desc = 'Telescope: LSP Diagnostics' }
)
vim.keymap.set(
  'n', '<leader>km', builtin.keymaps, { desc = 'Telescope: Key Mappings' }
)
