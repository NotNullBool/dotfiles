return {
	"chrisgrieser/nvim-spider",
	main = "spider",
	lazy = true,
	keys = {
		{'w', ":lua require('spider').motion('w')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) w", silent = true},
		{'e', ":lua require('spider').motion('e')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) e", silent = true},
		{'b', ":lua require('spider').motion('b')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) b", silent = true},
		{"ge", ":lua require('spider').motion('ge')<cr>", mode = {'n', 'o', 'x'}, desc = "(Spider) ge", silent = true},
	}
}
