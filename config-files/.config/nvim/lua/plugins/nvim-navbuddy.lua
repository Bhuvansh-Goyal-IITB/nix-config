return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>')
  end,
}
