return {
	-- 1. LSP Signature (The floating parameter window)
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded",
				},
				-- INTEGRATION: This ensures the signature window acts nicely with nvim-cmp
				hint_enable = false, -- Disable inline hints if you prefer only the floating window
				zindex = 50, -- Ensure it doesn't hide the completion menu
			})
		end,
	},

	-- 2. CMP Capabilities
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			-- We don't need to do anything here.
			-- We just need this plugin installed so we can require it in Mason.lua
		end,
	},

	-- 3. Other utilities
	{ "antosha417/nvim-lsp-file-operations", config = true },
	{ "folke/lazydev.nvim", ft = "lua" },
}
