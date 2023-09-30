return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
	},
	config = function (_,opts)
		local actions = require("which-key.plugins.registers").actions
		table.insert(actions, { trigger = '"_', mode = "n"})
		require("which-key").setup(opts)
	end
}
