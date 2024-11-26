return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_menu_selection_background = 'red'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.g.gruvbox_material_float_style = 'dim'
  end,
  config = function()
    vim.cmd.colorscheme 'gruvbox-material'
    vim.cmd 'hi FloatBorder guibg=None'
    vim.cmd 'hi NormalFloat guibg=None'
    vim.cmd 'hi WinSeparator guibg=None'
  end,
}
