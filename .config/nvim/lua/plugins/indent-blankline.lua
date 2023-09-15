return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		space_char_blankline = " ",
		show_current_context = true,
		-- show_current_context_start = true, -- uncomment for underline under functions
		show_trailing_blankline_indent = false,
		-- default : {'class', 'function', 'method'}
		context_patterns = {
			"class",
			"function",
			"method",
			"^if",
			"^while",
			"^for",
			"^object",
			"^table",
			"^type",
			"^import",
			"block",
			"arguments"
		},
		-- disabled now for performance hit.
		use_treesitter = true
	}
}
