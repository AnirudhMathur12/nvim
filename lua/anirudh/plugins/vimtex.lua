-- lua/plugins/vimtex.lua
return {
    "lervag/vimtex",
    lazy = false, -- do not lazily load
    -- optional: pin version, if you want stable one
    -- tag = "v2.15",
    init = function()
        -- early settings
        vim.g.vimtex_view_method = "zathura"     -- or whatever viewer you use
        vim.g.vimtex_compiler_method = "latexmk" -- preferred compiler
        vim.g.vimtex_quickfix_open_on_warning = 0
        -- more global settings as needed
    end,
    config = function()
        -- settings that depend on plugin being loaded
        -- e.g. custom view options per viewer
        -- mappings if you want custom ones etc.

        -- run compile and view on every save
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*.tex",
            callback = function()
                --- vim.cmd("VimtexCompile")
                vim.cmd("VimtexView")
            end,
        })
    end,
}
