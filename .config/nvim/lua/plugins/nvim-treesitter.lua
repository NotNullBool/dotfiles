return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
    	"windwp/nvim-ts-autotag",
    },
    config = function ()
    	local treesitter = require("nvim-treesitter.configs")

    	treesitter.setup({ --enable syntax highlighting
	    highlight = { enable = true },
--	    indent = { enable = true },
	    autotag = { enable = true },
	    comment_commentstring = { -- enable nvim-ts-conetext-commentstring plugin for commenting tsx and jsx
	    	enable = true,
	    	enable_autocmd = false,
	    },
	    auto_install = true,
	})
    end,
}
