return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
    	"nvim-telescope/telescope.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "antosha417/nvim-lsp-file-operations", config = true }, -- update nvim-tree names in imports
    },
    config = function()
	local lspconfig = require("lspconfig")

	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local keymap = vim.keymap -- for concisenesss
	local opts = { noremap = true, silent = true }

---@diagnostic disable-next-line: unused-local
	local on_attach = function(client, bufnr)
	    opts.buffer = bufnr

	    opts.desc = "Show LSP references"
	    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	    opts.desc = "Show workspace diagnostics"
	    keymap.set("n", "gW", "<cmd>Telescope diagnostics<CR>", opts)

	    opts.desc = "Got to declaration"
	    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	    opts.desc = "Show LSP definition"
	    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	    opts.desc = "Show LSP implementations"
	    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	    opts.desc = "Show LSP type definitions"
	    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	    opts.desc = "See available code actions"
	    keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

	    opts.desc = "Smart rename"
	    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	    opts.desc = "Show buffer diagnostics"
	    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	    opts.desc = "Show line diagnostics"
	    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	    opts.desc = "Go to previous diagnostic"
	    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	    opts.desc = "Go to next diagnostic"
	    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	    opts.desc = "Show documentation for what is under cursor"
	    keymap.set("n", "K", vim.lsp.buf.hover, opts)

	    opts.desc = "Restart LSP"
	    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	end

	--used to enable auto complion
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- Change the Diagnostic symbols in the sign column (gutter)	    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
	    local hl = "DiagnosticSign" .. type
	    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	mason.setup()

	mason_lspconfig.setup({
	    -- auto-install configured servers (with lspconfig)
	    automatic_installation = true,
	})

	mason_lspconfig.setup_handlers({
	    function(server_name)
	    	lspconfig[server_name].setup({
		    capabilities = capabilities,
		    on_attach = on_attach,
		})
	    end,

	    -- example of how to overide the default setup
	    --["rust_analyzer"] = function ()
	    --	require("rust-tools").setup {}
	    --end
	    ["lua_ls"] = function()
		lspconfig["lua_ls"].setup({
		    capabilities = capabilities,
		    on_attach = on_attach,

		    settings = {
			Lua = {
			    diagnostics = {
				global = { "vim" },
			    },
			    workspace = {
				library = {
				    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
				},
			    },
			},
		    },
		})
	    end

	})

    end,
}
