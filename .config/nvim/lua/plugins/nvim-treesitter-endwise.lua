return {
	"RRethy/nvim-treesitter-endwise",
	event = "InsertEnter",
	main = "nvim-treesitter.configs",
	ft = {"lua"},
	dependencies = {
		"nvim-treesitter/nvim-treesitter"
	},
	opts = {
		enable = true
	}
}
