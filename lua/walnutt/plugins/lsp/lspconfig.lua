return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "LSP: Show definitions"
        keymap.set("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", opts)

        opts.desc = "LSP: Show declarations"
        keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

        opts.desc = "LSP: Show description"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "LSP: Show implementation"
        keymap.set(
          "n",
          "<leader>li",
          "<cmd>FzfLua lsp_implementations<CR>",
          opts
        )

        opts.desc = "LSP: Show references"
        keymap.set("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", opts)

        opts.desc = "LSP: Show signature help"
        keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)

        opts.desc = "LSP: Show type definition"
        keymap.set("n", "<leader>lt", "<cmd>FzfLua lsp_typedefs<CR>", opts)

        opts.desc = "LSP: Show document symbols"
        keymap.set("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols", opts)

        opts.desc = "LSP: Treesitter Symbols"
        keymap.set("n", "<leader>lT", "<cmd>FzfLua treesitter<CR>", opts)

        opts.desc = "LSP: Rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "LSP: Code action"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "LSP: Format file"
        keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

        opts.desc = "LSP: Show buffer diagnositics"
        keymap.set(
          "n",
          "<leader>d",
          "<cmd>FzfLua diagnostics_document<CR>",
          opts
        )

        opts.desc = "LSP: Show workspace diagnositics"
        keymap.set(
          "n",
          "<leader>dw",
          "<cmd>FzfLua diagnostics_workspace<CR>",
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

    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰠠",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.ERROR] = "",
        },
      },
    })
  end,
}
