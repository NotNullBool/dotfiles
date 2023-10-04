return {{
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
	opts = {
		--enable syntax highlighting
		indent = { enable = true },
		highlight = { enable = true },
		incremental_selection = {enable = true},
		endwise = { enable = true }
	},
},{
		"RRethy/nvim-treesitter-endwise",
		event = "InsertEnter *.lua",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
}}
