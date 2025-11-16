return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            "lua_ls",
        }
    },

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",

    }


}
