vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search for visually highlighted text
vim.keymap.set("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- Navigation center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search center cursor
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Save previous yank
vim.keymap.set("x", "<leader>p", '"_dP')

-- Switch buffer windows shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Easy copy/paste to clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>p", '"+p')

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rl", ":set relativenumber!<CR>")

-- Toggle conceal level
vim.keymap.set("n", "<leader>cl", function()
	if vim.o.conceallevel == 0 then
		vim.o.conceallevel = 2
	else
		vim.o.conceallevel = 0
	end
end, { desc = "Toggle conceal level" })
