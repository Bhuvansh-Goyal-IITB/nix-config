return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
  end,
  config = function()
    vim.cmd.colorscheme 'gruvbox-material'
    vim.cmd 'hi FloatBorder guibg=None'
    vim.cmd 'hi NormalFloat guibg=None'
    vim.cmd 'hi WinSeparator guibg=None'
  end,
}
