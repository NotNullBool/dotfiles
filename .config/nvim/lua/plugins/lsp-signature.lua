return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		hint_prefix = " ",
		handler_opts = {
			border = "single"
		}
	},
	config = function(_, opts) require'lsp_signature'.setup(opts) end
}
