return {
    "nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		{ "stevearc/aerial.nvim", config = true },
		"tsakirist/telescope-lazy.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local builtin = require('telescope.builtin')
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- border = false,
				path_display = { "truncat "},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				lazy = {
					-- Optional theme (the extension doesn't set a default theme)
					-- theme = "ivy",
					-- Whether or not to show the icon in the first column
					show_icon = true,
					-- Mappings for the actions
					mappings = {
						open_in_browser = "<C-o>",
						open_in_file_browser = "<M-b>",
						open_in_find_files = "<C-f>",
						open_in_live_grep = "<C-g>",
						open_plugins_picker = "<C-b>", -- Works only after having called first another action
						open_lazy_root_find_files = "<C-r>f",
						open_lazy_root_live_grep = "<C-r>g",
					},
					-- Other telescope configuration options
				},
				undo = {
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("aerial")
		telescope.load_extension("lazy")
		telescope.load_extension("undo")
		telescope.load_extension("ui-select")
		vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Find buffer" })
		vim.keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		vim.keymap.set('n', "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		vim.keymap.set('n', "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set('n', "<leader>ft", "<cmd>Telescope aerial<cr>", { desc = "Fuzzy find functions in file" })
		vim.keymap.set('n', "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo telescope" })

		local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

		local purple1 = '#333352'
		local purple2 = '#232338'
		local purple3 = '#12121c'
		local red1 = '#ba3648'
		local green1 = '#37ad39'
		local blue1 = '#0985de'
		local blue3 = '#313244'

		----------------------------------------------------------------------
		--                              Prompt                              --
		----------------------------------------------------------------------
		vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
			fg = purple3,
			bg = purple3,
		})

		vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
			fg = normal_hl.foreground,
			bg = purple3,
		})

		vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
			fg = normal_hl.foreground,
			bg = red1,
		})

		vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
			fg = red1,
			bg = purple3,
		})

		vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
			fg = red1,
			bg = purple3,
		})

		----------------------------------------------------------------------
		--                              Result                              --
		----------------------------------------------------------------------
		vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
			fg = purple2,
			bg = purple2,
		})

		vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
			fg = normal_hl.foreground,
			bg = purple2,
		})

		vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
			fg = normal_hl.foreground,
			bg = blue1,
		})

		vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
			fg = blue1,
			bg = blue3,
		})

		----------------------------------------------------------------------
		--                             Preview                              --
		----------------------------------------------------------------------

		vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
			fg = purple1,
			bg = purple1,
		})

		vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {
			fg = normal_hl.foreground,
			bg = purple1,
		})

		vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
			fg = normal_hl.foreground,
			bg = green1,
		})
	end
}
