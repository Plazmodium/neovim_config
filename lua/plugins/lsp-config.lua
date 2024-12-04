return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"lua_ls",
					"angularls",
					"astro",
					"cssls",
					"cssmodules_ls",
					"css_variables",
					"html",
					"jsonls",
					"ts_ls",
					"dockerls",
					"emmet_ls", -- Add this for better HTML/CSS completion
					"tailwindcss", -- Add this if you use Tailwind
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

			-- ANGULAR
			local lspconfig = require("lspconfig")

			lspconfig.angularls.setup({
				cmd = {
					"angular-language-server",
					"--ngProbeLocations",
					vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/lib/node_modules",
					"--tsProbeLocations",
					vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server",
					"--stdio",
				},
				on_attach = function(client, bufnr)
					-- Set up buffer-specific key mappings and options here
					local buf_set_keymap = vim.api.nvim_buf_set_keymap
					local opts = { noremap = true, silent = true }

					buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				end,
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
				root_dir = lspconfig.util.root_pattern("angular.json", "package.json"),
			})

			-- HTML setup with enhanced capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ" },
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
				},
			})

			-- CSS setup with enhanced capabilities
			lspconfig.cssls.setup({
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- Emmet setup
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
			})

			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.cssmodules_ls.setup({})
			lspconfig.css_variables.setup({})
			lspconfig.html.setup({})
			lspconfig.dockerls.setup({})

			-- ESLint setup
			lspconfig.eslint.setup({
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css" },
				root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js"),
			})

			-- Key bindings for LSP actions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	-- Autocompletion plugins
	{
		"hrsh7th/nvim-cmp", -- Autocompletion plugin
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer completion source
			"hrsh7th/cmp-path", -- File path completion source
			"hrsh7th/cmp-vsnip", -- Snippet completion source (optional)
			"hrsh7th/vim-vsnip", -- Snippet engine (optional)
			"L3MON4D3/LuaSnip", -- Add snippet support
			"saadparwaiz1/cmp_luasnip", -- Add snippet completion
			"rafamadriz/friendly-snippets", -- Add predefined snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
