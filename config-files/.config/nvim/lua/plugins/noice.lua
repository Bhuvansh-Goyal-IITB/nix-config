return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    require('noice').setup {
      cmdline = {
        format = {
          IncRename = { icon = '⟳' },
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      popupmenu = {
        kind_icons = false,
      },
    }
    vim.keymap.set({ 'n', 'i', 's' }, '<c-n>', function()
      if not require('noice.lsp').scroll(4) then
        return '<c-n>'
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ 'n', 'i', 's' }, '<c-p>', function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-p>'
      end
    end, { silent = true, expr = true })
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
  },
}
