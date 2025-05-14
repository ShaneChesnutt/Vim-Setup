return {
  "williamboman/mason.nvim",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup({
      -- Servers to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "solargraph",
        "ruby_lsp",
      },
      -- Auto-install servers (with lspconfig)
      automatic_installation = true,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ruby_lsp = function()
          lspconfig.ruby_lsp.setup({
            capabilities = capabilities,
            cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv("GLOBAL_GEMFILE") },
          })
        end,
        rubocop = function()
          lspconfig.rubocop.setup({
            capabilities = capabilities,
            cmd = { os.getenv("HOME") .. "/.rbenv/shims/rubocop", "--lsp" },
            cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv("GLOBAL_GEMFILE") },
            opts = {
              format = {
                timeout_ms = 10000,
              },
            },
          })
        end,
        solargraph = function()
          lspconfig.solargraph.setup({
            capabilities = capabilities,
            filetypes = { "ruby" },
            cmd = {
              os.getenv("HOME") .. "/.rbenv/shims/solargraph",
              "stdio",
            },
            settings = {
              solargraph = {
                diagnostics = true,
                -- formatting = true,
                folding = true,
                checkGemVersion = false,
                references = true,
                rename = true,
                completion = true,
                useBundler = true,
                bundlePath = vim.fn.expand("~/.rbenv/shims/bundle"),
              },
            },
            on_attach = function()
              vim.cmd([[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
            end,
          })
        end,
        lua_ls = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "rubocop",
        "eslint_d",
      },
    })
  end,
}
