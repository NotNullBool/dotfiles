return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
    	'nvim-lua/plenary.nvim',
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-tree/nvim-web-devicons",
    },
    config = function()
	local builtin = require('telescope.builtin')
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
	    defaults = {
	    	path_display = { "truncat "},
	    	mappings = {
		    i = {
		    	["<C-k>"] = actions.move_selection_previous, -- move to prev result
		    	["<C-j>"] = actions.move_selection_next, -- move to next result
		    	["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		    },
		},
	    },
	})

	telescope.load_extension("fzf")
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files in cwd" })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find string in cwd" })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
	vim.keymap.set('n', '<leader>fc', "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	vim.keymap.set('n', '<leader>fr', "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    end
}
