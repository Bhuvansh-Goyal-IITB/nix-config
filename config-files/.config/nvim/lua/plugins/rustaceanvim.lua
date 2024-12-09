return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        handlers = {
          ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
          ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
        },
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
    }
  end,
}
