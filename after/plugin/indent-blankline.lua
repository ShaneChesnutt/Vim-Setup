require("indent_blankline").setup {
    show_end_of_line = true,
}

vim.keymap.set("n", "<leader>ig", ":IndentBlanklineToggle!<CR>")
