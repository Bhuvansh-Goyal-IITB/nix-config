vim.g.mapleader = ' '

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':enew<CR>', { silent = true })
