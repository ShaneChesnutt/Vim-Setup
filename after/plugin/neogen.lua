local neogen = require('neogen')
neogen.setup(
  {
    languages = {
      ['javascript.jsdoc'] = require('neogen.configurations.javascript')
    }
  }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>gd', ':lua require(\'neogen\').generate()<CR>',
  { noremap = true, silent = true }
)
