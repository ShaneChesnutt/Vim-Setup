local obsidian = require('obsidian')

obsidian.setup(
  {
    workspaces = {
      { name = 'personal', path = '~/workspace/personal/Notebook/' }
    },
    completion = { nvim_cmp = true, min_chars = 2 },
    mappings = {},
    new_notes_location = 'current_dir',
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then note:add_alias(note.title) end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do out[k] = v end
      end

      return out
    end,
    templates = {
      subdir = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {}
    },
    ui = { enable = true }
  }
)

-- Key Mappings
vim.keymap.set(
  'n', '<leader>oc', obsidian.util.toggle_checkbox,
  { desc = 'Obsidian: Check checkbox' }
)
vim.keymap.set(
  'n', '<leader>ot', '<cmd>ObsidianTemplate<CR>',
  { desc = 'Obsidian: Insert templates' }
)
vim.keymap.set(
  'n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Obsidian: Open in App' }
)
vim.keymap.set(
  'n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>',
  { desc = 'Obsidian: Show backlinks' }
)
vim.keymap.set(
  'n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Obsidian: Show links' }
)
vim.keymap.set(
  'n', '<leader>on', '<cmd>ObsidianNew<CR>',
  { desc = 'Obsidian: Create new note' }
)
vim.keymap.set(
  'n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Obsidian: Search' }
)
vim.keymap.set(
  'n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>',
  { desc = 'Obsidian: Quick switch' }
)
