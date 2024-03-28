local lsp_zero = require('lsp-zero')

function merge_opts(default_opts, opts)
  return table.move(default_opts, 1, #default_opts, #opts, opts)
end

lsp_zero.on_attach(
  function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, merge_opts(opts, { desc = "LSP: Definition" }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, merge_opts(opts, { desc = "LSP: Declarations" }))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, merge_opts(opts, { desc = "LSP: Description" }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, merge_opts(opts, { desc = "LSP: Implementations" }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, merge_opts(opts, { desc = "LSP: References" }))
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, merge_opts(opts, { desc = "LSP: Signature help" }))
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, merge_opts(opts, { desc = "LSP: Type definition" }))
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, merge_opts(opts, { desc = "LSP: Rename" }))
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, merge_opts(opts, { desc = "LSP: Code action" }))
    vim.keymap.set(
      'n', '<leader>ff', function() vim.lsp.buf.format { async = true } end,
      merge_opts(opts, { desc = "LSP: Format buffer" })
    )
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, merge_opts(opts, { desc = "LSP: Show diagnostics" }))
    vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, merge_opts(opts, { desc = "LSP: Next diagnostic" }))
    vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, merge_opts(opts, { desc = "LSP: Prev diagnostic" }))
  end
)

lsp_zero.set_sign_icons(
  { error = '', warn = '', hint = '', info = '' }
)

lsp_zero.format_on_save(
  {
    format_opts = { async = false, timeout_ms = 10000 },
    servers = {
      ['tsserver'] = { 'javascript', 'typescript' },
      ['lua_ls'] = { 'lua' }
    }
  }
)

vim.diagnostic.config(
  {
    virtual_text = false, -- Turn off inline diagnostics
    severity_sort = true
  }
)

require('mason').setup({})
require('mason-lspconfig').setup(
  {
    ensure_installed = { 'tsserver', 'lua_ls', 'solargraph' },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        require('lspconfig').lua_ls.setup(
          {
            on_init = function(client)
              local path = client.workspace_folders[1].name
              if not vim.loop.fs_stat(path .. '/.luarc.json') and
                  not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend(
                  'force', client.config.settings, {
                    Lua = {
                      runtime = { version = 'LuaJIT' },
                      workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME }
                      }
                    }
                  }
                )
              end
              return true
            end
          }
        )
      end
    }
  }
)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup(
  {
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      {
        name = 'luasnip',
        keyword_length = 2
      },
      {
        name = 'buffer',
        keyword_length = 3
      }
    },
    formatting = lsp_zero.cmp_format({ details = false }),
    mapping = cmp.mapping.preset.insert(
      {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete()
      }
    )
  }
)
