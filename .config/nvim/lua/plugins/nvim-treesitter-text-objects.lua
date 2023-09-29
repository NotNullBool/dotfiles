return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	version = false,
	build = ":TSUpdate",
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
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region (TSTextObject)" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region (TSTextObject)" },

						["a:"] = { query = "@parameter.outer", desc = "Select outer part of an parameter/field region (TSTextObject)" },
						["i:"] = { query = "@parameter.inner", desc = "Select inner part of an parameter/field region (TSTextObject)" },

						["ai"] = { query = "@conditional.outer", desc = "Select outer part of an conditional region (TSTextObject)" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of an conditional region (TSTextObject)" },

						["al"] = { query = "@loop.outer", desc = "Select outer part of an loop region (TSTextObject)" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of an loop region (TSTextObject)" },

						["ab"] = { query = "@block.outer", desc = "Select outer part of an block region (TSTextObject)" },
						["ib"] = { query = "@block.inner", desc = "Select inner part of an block region (TSTextObject)" }, -- overrides default text object block of parenthesis to parenthesis

						["af"] = { query = "@function.outer", desc = "Select outer part of an function region (TSTextObject)" },
						["if"] = { query = "@function.inner", desc = "Select inner part of an function region (TSTextObject)" },

						["ac"] = { query = "@class.outer", desc = "Select outer part of an class region (TSTextObject)" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of an class region (TSTextObject)" },
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
