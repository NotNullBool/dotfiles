return {
	"NotNullBool/nvim-surround",
	keys = { "ys", "ds", "cs" },
	version = "*",
	opts = {
		highlight = {duration = 0}
	},
	config = function (_,opts)
		require("nvim-surround").setup(opts)
	end
}
