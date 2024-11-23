return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.lua_ls.setup {
      capabilities = capabilities,
    }
    lspconfig.gopls.setup {
      capabilities = capabilities,
    }
    lspconfig.clangd.setup {
      capabilities = capabilities,
    }
    lspconfig.taplo.setup {
      capabilities = capabilities,
    }
    lspconfig.nil_ls.setup {
      capabilities = capabilities,
    }

    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
  end,
}
