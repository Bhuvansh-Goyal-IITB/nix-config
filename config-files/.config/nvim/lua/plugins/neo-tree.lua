return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      popup_border_style = 'rounded',
      window = {
        width = 30,
      },
    }
  end,
}
