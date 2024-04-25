return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "LSP: Show definitions"
        keymap.set(
          "n",
          "<leader>gd",
          "<cmd>Telescope lsp_definitions<CR>",
          opts
        )

        opts.desc = "LSP: Show declarations"
        keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

        opts.desc = "LSP: Show description"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "LSP: Show implementation"
        keymap.set(
          "n",
          "<leader>gi",
          "<cmd>Telescope lsp_implementations<CR>",
          opts
        )

        opts.desc = "LSP: Show references"
        keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "LSP: Show signature help"
        keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, opts)

        opts.desc = "LSP: Show type definition"
        keymap.set(
          "n",
          "<leader>gt",
          "<cmd>Telescope lsp_type_definitions<CR>",
          opts
        )

        opts.desc = "LSP: Rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "LSP: Code action"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "LSP: Format file"
        keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)

        opts.desc = "LSP: Show buffer diagnositics"
        keymap.set(
          "n",
          "<leader>d",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          opts
        )

        opts.desc = "LSP: Show line diagnositics"
        keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

        opts.desc = "LSP: Goto next diagnositic"
        keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)

        opts.desc = "LSP: Goto prev diagnositic"
        keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
      end,
    })

    -- Used to enable autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
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
      ["solargraph"] = function()
        lspconfig["solargraph"].setup({
          capabilities = capabilities,
          filetypes = { "ruby" },
          cmd = {
            os.getenv("HOME") .. "/.rbenv/shims/solargraph",
            "stdio",
          },
          settings = {
            solargraph = {
              diagnostics = true,
              formatting = true,
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
    })

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs =
      { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
