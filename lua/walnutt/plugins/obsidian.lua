return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local obsidian = require("obsidian")

    obsidian.setup({
      workspaces = {
        { name = "personal", path = "~/workspace/personal/Notebook/" },
      },
      completion = { nvim_cmp = true, min_chars = 2 },
      mappings = {},
      new_notes_location = "current_dir",
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      templates = {
        subdir = "Templates",
        date_format = "%m-%d-%Y",
        time_format = "%H:%M",
        substitutions = {
          date_add_1 = function()
            return os.date("%m-%d-%Y", os.time() + 24 * 60 * 60)
          end,
          date_add_2 = function()
            return os.date("%m-%d-%Y", os.time() + 48 * 60 * 60)
          end,
          date_add_3 = function()
            return os.date("%m-%d-%Y", os.time() + 72 * 60 * 60)
          end,
          date_add_4 = function()
            return os.date("%m-%d-%Y", os.time() + 96 * 60 * 60)
          end,
        },
      },
      ui = { enable = true },
    })

    local keymap = vim.keymap

    -- Key Mappings
    keymap.set(
      "n",
      "<leader>oc",
      obsidian.util.toggle_checkbox,
      { desc = "Obsidian: Check checkbox" }
    )
    keymap.set(
      "n",
      "<leader>ot",
      "<cmd>ObsidianTemplate<CR>",
      { desc = "Obsidian: Insert templates" }
    )
    keymap.set(
      "n",
      "<leader>oo",
      "<cmd>ObsidianOpen<CR>",
      { desc = "Obsidian: Open in App" }
    )
    keymap.set(
      "n",
      "<leader>ob",
      "<cmd>ObsidianBacklinks<CR>",
      { desc = "Obsidian: Show backlinks" }
    )
    keymap.set(
      "n",
      "<leader>ol",
      "<cmd>ObsidianLinks<CR>",
      { desc = "Obsidian: Show links" }
    )
    keymap.set(
      "n",
      "<leader>on",
      "<cmd>ObsidianNew<CR>",
      { desc = "Obsidian: Create new note" }
    )
    keymap.set(
      "n",
      "<leader>os",
      "<cmd>ObsidianSearch<CR>",
      { desc = "Obsidian: Search" }
    )
    keymap.set(
      "n",
      "<leader>oq",
      "<cmd>ObsidianQuickSwitch<CR>",
      { desc = "Obsidian: Quick switch" }
    )
  end,
}
