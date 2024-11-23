return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      notify_on_error = false,
      notify_no_formatters = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      },
      formatters = {
        ['clang-format'] = {
          args = { '--style', 'google' },
        },
      },
    }
  end,
}
