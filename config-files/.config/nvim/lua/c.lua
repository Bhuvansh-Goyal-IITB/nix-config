vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function(args)
    vim.lsp.start({
      name = 'clangd',
      cmd = {'clangd'},
      root_dir = vim.fs.root(args.buf, {"Makefile", ".git"}),
    })
  end,
})
