return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
    	require("nvim-treesitter.configs").setup({
	    textobjects = {
		select = {
		    enable = true,

		    -- Automatically jump forward to textobj, similar to targets.vim
		    lookahead = true,

		    keymaps = {
		    	-- you can use the capture groups defined in textobjects.scm
		    	["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
		    	["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

		    	["a:"] = { query = "@parameter.outer", desc = "Select outer part of an parameter/field region" },
		    	["i:"] = { query = "@parameter.inner", desc = "Select inner part of an parameter/field region" },

		    	["ai"] = { query = "@conditional.outer", desc = "Select outer part of an conditional region" },
		    	["ii"] = { query = "@conditional.inner", desc = "Select inner part of an conditional region" },

		    	["al"] = { query = "@loop.outer", desc = "Select outer part of an loop region" },
		    	["il"] = { query = "@loop.inner", desc = "Select inner part of an loop region" },

		    	["ab"] = { query = "@block.outer", desc = "Select outer part of an block region" },
		    	["ib"] = { query = "@block.inner", desc = "Select inner part of an block region" }, -- overrides default text object block of parenthesis to parenthesis

		    	["af"] = { query = "@function.outer", desc = "Select outer part of an function region" },
		    	["if"] = { query = "@function.inner", desc = "Select inner part of an function region" },

		    	["ac"] = { query = "@class.outer", desc = "Select outer part of an class region" },
		    	["ic"] = { query = "@class.inner", desc = "Select inner part of an class region" },
		    },
		    include_surrouding_whitespace = true,
		},
		swap = {
		    enable = true,
		    swap_next = {
		    	["<leader>on"] = "@parameter.inner", --swap object under cursor with next
		    },
		    swap_previous = {
		    	["<leader>op"] = "@parameter.inner", --swap object under cursor with previous
		    },
		},
	    },
	})

    end,
}
