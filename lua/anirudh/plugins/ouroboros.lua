return {
	"jakemason/ouroboros.nvim",
	ft = { "c", "h", "cpp", "hpp" },
	config = function()
		require("ouroboros").setup({
			extension_preferences_table = {
				c = { h = 2 },
				h = { c = 2 },
				cpp = { hpp = 2, h = 1 },
				hpp = { cpp = 2, h = 1 },
			},
			-- optionally other settings
			switch_to_open_pane_if_possible = false,
		})
		vim.keymap.set("n", "<leader>o", ":Ouroboros<CR>", { noremap = true, silent = true })
	end,
}
