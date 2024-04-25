return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- Source for text in buffer
    "hrsh7th/cmp-path", -- Source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- Autocompletion
    "rafamadriz/friendly-snippets", -- Useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- Configure how nvim-cmp interacts with Luasnip
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-n>"] = cmp.mapping.scroll_docs(-4),
        ["<C-p>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- Open Completions
        ["<C-Backspace>"] = cmp.mapping.abort(), -- Close completions
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "path" }, -- file system paths
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 }, -- snippets
        { name = "buffer", keyword_length = 3 }, -- text within current buffer
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
          -- Uncomment to enable source text in cmp menu
          -- menu = {
          --   buffer = "[Buffer]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[LuaSnip]",
          --   nvim_lua = "[Lua]",
          --   latex_symbols = "[Latex]",
          -- },
        }),
      },
    })
  end,
}
