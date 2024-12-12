-- leader
vim.g.mapleader = ' '

-- jk -> esc
vim.keymap.set('i', 'jk','<esc>')

-- File tree
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Things that shouldnt go to a register
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'X', '"_d')
vim.keymap.set({'n', 'x'}, 'c', '"xc')
vim.keymap.set({'n', 'v'}, 'XX', '"_dd')

-- <leader>y --> to '+' register (system clipboard)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Movign lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- replace word below cursor in all the file
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

