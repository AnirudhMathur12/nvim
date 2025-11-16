-- lua/plugins/colorscheme.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"

        require("gruvbox").setup({

            overrides = {
                ["@namespace"] = {fg = "#8ec07c"},
                ["@type.qualifier"] = {fg = "#8ec07c"},
            }
        })

      vim.cmd("colorscheme gruvbox")
    end,
  },
}
