return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("lsp_signature").setup({
            bind = true,
            hint_enable = true,
            floating_window = false,
            hint_prefix = "", -- Remove the emoji
            hi_parameter = "LspSignatureActiveParameter",
        })
    end,
}
