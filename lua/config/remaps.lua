-- leader
vim.g.mapleader = ' '

-- jk -> esc
vim.keymap.set('i', 'jk','<esc>')

-- File tree
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Things that shouldnt go to a register
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'X', '"_d')
vim.keymap.set({'n', 'v'}, 'XX', '"_dd')
vim.keymap.set({'n', 'x'}, 'c', '"xc')

-- Movign lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
