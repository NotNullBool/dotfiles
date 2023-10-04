return{
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"linrongbin16/lsp-progress.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		lualine.setup{
			options = {
				theme = "dracula",
				component_separators = { left = '|', right = '|'},
				section_separators = { left = '', right = ''},
			},
			sections = {
				lualine_x = {
					require('lsp-progress').progress(),
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#FFCA80" }, --orange
					},
				},
				lualine_y = {
					--{ "encoding" },
					--{ "fileformat" },
					{ "filetype" },
				},
				lualine_z = {'location'}
			},
		}
		-- listen lsp-progress event and refresh lualine
		vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
		vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
			group = "lualine_augroup",
			callback = require("lualine").refresh,
		})
	end
}
