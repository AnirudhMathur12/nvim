return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night", -- options: "storm" (contrast), "night", "day"
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = false },
                functions = {},
                variables = {},
            },
            sidebars = { "qf", "help" },
            hide_inactive_statusline = false,
            dim_inactive = false,
            lualine_bold = true,
        })
        vim.cmd("colorscheme tokyonight")
    end,
}
