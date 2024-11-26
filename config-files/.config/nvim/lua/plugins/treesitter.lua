return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = {
        'c',
        'cpp',
        'lua',
        'luadoc',
        'go',
        'make',
        'toml',
        'nix',
        'kdl',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
