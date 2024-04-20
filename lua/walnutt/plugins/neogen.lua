return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local neogen = require("neogen")
		neogen.setup({
			languages = {
				["javascript.jsdoc"] = require("neogen.configurations.javascript"),
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "<Leader>cd", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
	end,
}
