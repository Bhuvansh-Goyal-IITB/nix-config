return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'SmiteshP/nvim-navbuddy',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local navbuddy = require 'nvim-navbuddy'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local border = 'rounded'

    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    local default_lsp_setup = {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
      end,
    }

    local servers = {
      'pyright',
      'gopls',
      'clangd',
      'taplo',
      'nil_ls',
      'rust_analyzer',
      'lua_ls',
      'texlab',
    }

    -- use this for specific setups
    local server_setup = {}

    for _, server in ipairs(servers) do
      lspconfig[server].setup(server_setup[server] or default_lsp_setup)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('bhuvansh-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf })
        end

        map('gr', require('telescope.builtin').lsp_references)
        map('gd', require('telescope.builtin').lsp_definitions)
        map('D', vim.diagnostic.open_float)
        map('<leader>rn', vim.lsp.buf.rename)
        map('<leader>ca', vim.lsp.buf.code_action)
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols)
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
        map('<leader>sd', require('telescope.builtin').diagnostics)
      end,
    })
    vim.diagnostic.config {
      float = { border = border },
    }
  end,
}
