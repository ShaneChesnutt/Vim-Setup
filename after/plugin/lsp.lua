local lsp = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_inlayhints = require('lsp-inlayhints')

lsp.preset('recommended')

lsp.ensure_installed({ 'tsserver', 'eslint' })

lsp.set_preferences(
  {
    set_lsp_keymaps = false -- set to false if you want to configure your own keybindings
  }
)

---@diagnostic disable-next-line: unused-local
lsp.on_attach(
  function(_client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set(
      'n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts
    )
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap
      .set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap
      .set('n', '<leader>gh', function() lsp_inlayhints.toggle() end, opts)
  end
)

lsp.configure(
  'lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
)

lsp.configure(
  'tsserver', {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      lsp_inlayhints.on_attach(client, bufnr)
    end,
    settings = {
      diagnostics = {
        ignoredCodes = {
          80001, -- Allow CommonJS modules
          7016 -- Allow untyped modules
        }
      },
      typescript = {
        inlayhints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true
        }
      },
      javascript = {
        inlayhints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true
        }
      }
    }
  }
)

lsp.configure(
  'solargraph', {
    capabilities = capabilities,
    filetypes = { 'ruby' },
    settings = {
      solargraph = {
        diagnostics = true,
        formatting = true,
        folding = true,
        checkGemVersion = false,
        useBundler = true,
        bundlePath = vim.fn.expand('~/.rbenv/shims/bundle')
      }
    },
    on_attach = function(client)
      if client.server_capabilities.documentRangeFormattingProvider then
        vim.cmd(
          [[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
      augroup END
      ]]
        )
      end
    end
  }
)

lsp.setup()
lsp_inlayhints.setup()

vim.diagnostic.config(
  {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true
  }
)

local signs = { Error = '', Warn = '', Hint = '', Info = '' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
