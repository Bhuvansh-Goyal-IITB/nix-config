vim.cmd("colorscheme retrobox")

vim.opt.path:append {"**"}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.completeopt = {'menuone', 'noinsert', 'popup'}

vim.diagnostic.config({ 
	update_in_insert = true,
})


require("c")
