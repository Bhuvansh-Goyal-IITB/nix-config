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
          ['textDocument/diagnostic'] = function(err, result, context, config)
            if err ~= nil and err.code == -32802 then
              return
            end
            return vim.lsp.handlers['textDocument/diagnostic'](err, result, context, config)
          end,
          ['workspace/diagnostic'] = function(err, result, context, config)
            if err ~= nil and err.code == -32802 then
              return
            end
            return vim.lsp.handlers['workspace/diagnostic'](err, result, context, config)
          end,
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
