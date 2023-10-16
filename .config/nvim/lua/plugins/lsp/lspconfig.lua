---@diagnostic disable: undefined-field
return {{
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim", opts = {automatic_installation = true,}}
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for concisenesss
		local opts = { noremap = true, silent = true }
		-- Under language features you can find the providers! https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#languageFeatures-side
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(env)
				local bufnr = env.buf

				local client = vim.lsp.get_client_by_id(env.data.client_id)
---@diagnostic disable-next-line: need-check-nil
				local server_capabilities = client.server_capabilities
				opts.buffer = bufnr

				if server_capabilities.referencesProvider then
					opts.desc = "Show LSP references"
					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				end

				if server_capabilities.declarationProvider then
					opts.desc = "Got to declaration"
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				end

				if server_capabilities.definitionProvider then
					opts.desc = "Show LSP definition"
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				end

				if server_capabilities.typeDefinitionProvider then
					opts.desc = "Show LSP type definitions"
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				end

				if server_capabilities.implementationProvider then
					opts.desc = "Show LSP implementations"
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				end

				if server_capabilities.codeActionProvider then
					opts.desc = "See available code actions"
					keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)
				end

				if server_capabilities.renameProvider then
					opts.desc = "Smart rename"
					keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
				end

				if server_capabilities.hoverProvider then
					opts.desc = "Show documentation for what is under cursor"
					keymap.set("n", "K", vim.lsp.buf.hover, opts)
				end

				if server_capabilities.signatureHelpProvider then
					opts.desc = "Show signature help"
					keymap.set('n', "gK", vim.lsp.buf.signature_help, opts)
					keymap.set('i', "<C-K>", vim.lsp.buf.signature_help, opts)
				end

				if (vim.version().minor > 9) and server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint(bufnr, true)
				end

				opts.desc = "Show workspace diagnostics"
				keymap.set("n", "gW", "<cmd>Telescope diagnostics<CR>", opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)


				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>lrs", ":LspRestart<CR>", opts)

			end
		})

		--- Used to enable auto complete
		local capabilities = cmp_nvim_lsp.default_capabilities()

		--- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󱐋 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end


		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- example of how to overide the default setup
			["rust_analyzer"] = function ()
				-- vim.g.rust_recommended_style = 0 -- neovim issue(#24075) soft tab stop breaks backspace on inline virtual text
				lspconfig["rust_analyzer"].setup({
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
								loadOutDirsFromCheck = true,
								runBuildScripts = true,
							},
							check = "clippy",
							-- Add clippy lints for Rust.
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--no-deps" },
							},
							procMacro = {
								enable = true,
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
						}
					},
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,

					settings = {
						Lua = {
							hint = { enable = true },
							diagnostics = {
								global = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								},
								checkThirdParty = false
							},
						},
					},
				})
			end

		})
	end,
}, {
		"folke/neodev.nvim",
		dependencies = "neovim/nvim-lspconfig",
		ft = {"lua"},
		config = true
},{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true
}}
