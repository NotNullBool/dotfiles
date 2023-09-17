return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {},
	config = function (_, opts)
	    vim.opt.termguicolors = true
	    require("bufferline").setup(opts)
	end
}
