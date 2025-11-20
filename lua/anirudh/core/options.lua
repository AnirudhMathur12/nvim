local opt = vim.opt

vim.opt.updatetime = 250 -- shorter delay for CursorHold
vim.api.nvim_create_augroup("DiagnosticsFloat", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = "DiagnosticsFloat",
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			scope = "cursor",
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "WinLeave" },
		})
	end,
})

--line numbers
opt.relativenumber = true
opt.number = true

--tab & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

--appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windods
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- opt.guicursor = "n-v-c-i:block"

vim.o.scrolloff = 5
