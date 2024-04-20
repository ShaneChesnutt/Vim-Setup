return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = { cursorline = true },
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "italic",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "italic",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
			},
		})

		vim.cmd("colorscheme onedark")
	end,
}
