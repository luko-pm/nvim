-- leader
vim.g.mapleader = " "

-- esc
vim.keymap.set('i','jk','<esc>')
vim.keymap.set('i','<esc>','<none>')

-- movement (cancelado, tengo que acostumbrarme al normal)
-- vim.keymap.set('','j','h')
-- vim.keymap.set('','k','j')
-- vim.keymap.set('','l','k')
-- vim.keymap.set('','ñ','l')

-- x no copia y X para borrar sin copiar a registro
vim.keymap.set('n','x','"_x')
vim.keymap.set({'n','v'},'X','"_d')
vim.keymap.set({'n','v'},'XX','"_XX')

-- cambiar cosas con 'c' tampoco copia a registro
vim.keymap.set({'n','x'},'c','"xc')


-- quicksope ??
-- let g:qs_highlight_on_keys = ['f','F','t','T']

-- which-key ??

-- highlightedyank ??

-- pv -> go to tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
