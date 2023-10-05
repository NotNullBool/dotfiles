return {{
	"NotNullBool/nvim-surround",
	lazy = false,
	keys = { "ys", "ds", "cs" },
	-- version = "*",
	opts = {
		highlight = {duration = 0}
	},
},{ "XXiaoA/ns-textobject.nvim", dependencies = {"NotNullBool/nvim-surround"}, opts = {}}}
