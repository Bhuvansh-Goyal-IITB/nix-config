vim.cmd("colorscheme retrobox")

vim.opt.path:append {"**"}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.completeopt = { 'menuone', 'noinsert', 'popup' }
vim.opt.pumheight = 10
vim.opt.winblend = 10
vim.opt.mouse = { a = true }

vim.diagnostic.config({ 
	virtual_text = false
})

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

require("c")
