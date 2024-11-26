return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local border = 'rounded'

    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    local lsp_setup = {
      capabilities = capabilities,
      handlers = handlers,
    }

    lspconfig.lua_ls.setup(lsp_setup)
    lspconfig.gopls.setup(lsp_setup)
    lspconfig.clangd.setup(lsp_setup)
    lspconfig.taplo.setup(lsp_setup)
    lspconfig.nil_ls.setup(lsp_setup)
    lspconfig.pyright.setup(lsp_setup)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
  end,
}
