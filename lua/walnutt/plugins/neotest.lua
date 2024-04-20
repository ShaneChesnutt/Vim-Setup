return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"olimorris/neotest-rspec",
		"vim-test/vim-test",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local neotest = require("neotest")
		local neotest_jest = require("neotest-jest")({ jestCommand = "npm test --" })

		neotest_jest.filter_dir = function(name)
			return name ~= "node_modules" and name ~= "__snapshots__"
		end

		neotest.setup({
			adapter = { neotest_jest, require("neotest-rspec") },
			status = { signs = false, virtual_text = true },
			icons = {
				expanded = "",
				child_prefix = "",
				child_indent = "",
				final_child_prefix = "",
				non_collapsible = "",
				collapsed = "",
				passed = "",
				running = "",
				failed = "",
				unknown = "",
			},
		})

		-- Keymappings
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>tw",
			"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
			{ desc = "Neotest: Run watch" }
		)
		keymap.set(
			"n",
			"<leader>tf",
			"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
			{ desc = "Neotest: Run file" }
		)
		keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Neotest: Run nearest" })
		keymap.set(
			"n",
			"<leader>td",
			"<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>",
			{ desc = "Neotest: Run debug" }
		)
		keymap.set(
			"n",
			"<leader>ts",
			"<cmd>lua require('neotest').summary.toggle()<cr>",
			{ desc = "Neotest: Toggle summary" }
		)
		keymap.set(
			"n",
			"<leader>to",
			"<cmd>lua require('neotest').output_panel.toggle()<cr>",
			{ desc = "Neotest: Toggle output panel" }
		)
	end,
}
