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

    local default_lsp_setup = {
      capabilities = capabilities,
      handlers = handlers,
    }

    local servers = {
      'pyright',
      'gopls',
      'clangd',
      'taplo',
      'nil_ls',
      'lua_ls',
      'texlab',
    }

    -- use this for specific setups
    local server_setup = {}

    local get_setup = function(custom_setup)
      if not custom_setup then
        return default_lsp_setup
      else
        local merged = {}

        for k, v in pairs(default_lsp_setup) do
          merged[k] = v
        end

        for k, v in pairs(custom_setup) do
          merged[k] = v
        end

        return merged
      end
    end

    for _, server in ipairs(servers) do
      lspconfig[server].setup(get_setup(server_setup[server]))
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('bhuvansh-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf })
        end
        map('gd', require('telescope.builtin').lsp_definitions)
        map('gr', require('telescope.builtin').lsp_references)
        map('gI', require('telescope.builtin').lsp_implementations)
        map('<leader>D', require('telescope.builtin').lsp_type_definitions)
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols)
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
        map('<leader>rn', vim.lsp.buf.rename)
        map('<leader>ca', vim.lsp.buf.code_action, { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end)
        end
      end,
    })
    vim.diagnostic.config {
      float = { border = border },
    }
  end,
}
