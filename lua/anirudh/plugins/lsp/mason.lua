return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp", -- Add as dependency to access capabilities
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		-- 1. Setup Mason
		mason.setup()

		-- 2. Prepare Capabilities (Integrates with nvim-cmp)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 3. Setup Mason-LSPConfig with Handlers
		mason_lspconfig.setup({
			ensure_installed = { "clangd", "lua_ls" }, -- Add your servers here

			-- "handlers" automatically sets up the servers in `ensure_installed`
			handlers = {
				-- The default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Example: Overriding specific settings for Lua
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
							},
						},
					})
				end,
			},
		})

		lspconfig.sourcekit.setup({
			capabilities = capabilities,
			cmd = { "xcrun", "sourcekit-lsp" },
			root_dir = lspconfig.util.root_pattern("Package.swift", ".git"),
		})
	end,
}
