local group = vim.api.nvim_create_augroup("clsp", { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
	group = group,
  callback = function(args)
    vim.lsp.start({
      name = 'clangd',
      cmd = {'clangd'},
      root_dir = vim.fs.root(args.buf, {"Makefile", ".git"}),
    })

		
  end,
})
