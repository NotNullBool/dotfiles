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
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-hop.nvim",
		{ "ahmedkhalf/project.nvim", main = "project_nvim", opts = {} },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

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
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				file_browser = {
					hijack_netrw = true,
					theme = "ivy",
					grouped = true,
					auto_depth = true
				},
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

					function _ADD_CURR_DIR_TO_PROJECTS()
						local historyfile = require("project_nvim.utils.path").historyfile
						local curr_directory = vim.fn.expand( "%:p:h" )
						vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
					end
					vim.cmd("command! ProjectAddManually lua _ADD_CURR_DIR_TO_PROJECTS()")
					local curdir = "plugins.telescope."
					require(curdir.."highlights").setup()
					telescope.load_extension("fzf")
					telescope.load_extension("aerial")
					telescope.load_extension("lazy")
					telescope.load_extension("undo")
					telescope.load_extension("ui-select")
					telescope.load_extension("file_browser")
					telescope.load_extension("projects")
					local keymap = vim.keymap
					keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
					keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
					keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Find buffer" })
					keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
					keymap.set('n', "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
					keymap.set('n', "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
					keymap.set('n', "<leader>ft", "<cmd>Telescope aerial<cr>", { desc = "Fuzzy find functions in file" })
					keymap.set('n', "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo telescope" })
					keymap.set('n', "<leader>e", "<cmd>Telescope file_browser<cr>", { desc = "Open Telescope file broswer" })
					keymap.set('n', "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Open Telescope projects" })
					keymap.set('n', "<leader>fap", "<cmd>ProjectAddManually<cr>", { desc = "Add current directory to projects" })
				end
			}
