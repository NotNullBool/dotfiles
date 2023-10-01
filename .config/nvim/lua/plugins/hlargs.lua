return {
	"m-demare/hlargs.nvim",
	event = "VeryLazy",
	config = function()
		local color = require("dracula").colors().orange
		require("hlargs").setup({color = color})
	end
}
