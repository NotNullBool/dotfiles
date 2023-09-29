return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function ()
    	local treesitter = require("nvim-treesitter.configs")

    	treesitter.setup({ --enable syntax highlighting
    		indent = {
    			enable = true
			},
			highlight = { enable = true },
		})
	end,
}
