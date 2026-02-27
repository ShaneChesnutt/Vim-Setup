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
        -- "solargraph",
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
            cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby_lsp" },
            filetypes = { "ruby", "eruby" },
            root_dir = function()
              return vim.loop.cwd()
            end,
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
        lua_ls = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = {
                    "vim",
                    "require",
                  },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                  enable = false,
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
