return{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
	'hrsh7th/cmp-buffer', --source for text in buffer
	'hrsh7th/cmp-path', -- source for file system
	'hrsh7th/cmp-cmdline', -- source for cmdline
	"L3MON4D3/LuaSnip", -- snippet engine
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- some default snippets
	"onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
	-- Set up nvim-cmp.
	local cmp = require('cmp')
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
	    completion = {
		completeopt = "menu,menuone,preview,noselect",
	    },
	    snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		    luasnip.lsp_expand(args.body) -- For `luasnip` users.
		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	    },
	    mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	    	["<C-j>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
		['<C-e>'] = cmp.mapping.abort(), -- close completion window
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	    }),
	    sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'buffer' }, -- text within current buffer
		{ name = "path" }, -- file system path
		{ name = "nvim_lua" },
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	    }),
	    formatting = {
	    	format = lspkind.cmp_format({
		    maxwidth = 50,
		    ellipsis_char = "...",
		}),
	    },
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	    }, {
		{ name = 'buffer' },
	    })
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = {
	        { name = 'buffer' }
	    }
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
		{ name = 'path' }
	    }, {
		{ name = 'cmdline' }
	    })
	})

    end
}