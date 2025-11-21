-- leader
vim.g.mapleader = ' '

-- jk -> esc
vim.keymap.set('i', 'jk','<esc>')

-- File tree
vim.keymap.set('n', '<leader>t', vim.cmd.Ex, {desc = "File tree"})

--[[ Register shit
keys  --> maps
------------------
D     --> cortar
DD    --> cortar línea
d     --> borrar 
dd    --> borrar línea
x     --> borrar caracter
]]--

--[[ TODO: nada de esto funciona bien la verdad

-- <leader>p  --> pegar copiando
-- p          --> pegar (sin copiar)

vim.keymap.set({'n', 'v'}, 'D', 'd')
vim.keymap.set({'n', 'v'}, 'DD', 'dd')
vim.keymap.set({'n', 'v'}, 'd', '"_d')
vim.keymap.set({'n', 'v'}, 'dd', '"_dd')
vim.keymap.set({'n', 'v'}, 'x', '"_x')
]]--

-- TODO: nada de esto funciona bien la verdad
-- vim.keymap.set("x", "<leader>p", 'p') -- pegar y copiar
-- vim.keymap.set("x", "p", [["_dP]]) -- pegar sin copiar
-- vim.keymap.set({'n', 'x'}, 'c', '"xc')

-- <leader>y --> to '+' register (system clipboard)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Movign lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- replace word below cursor in all the file
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- super mega custom hacker shit para poner acento a las letras
-- (así es doña lo he hecho yo con mis manitas, no big deal)
require("config.acentos")
vim.keymap.set("n", "<leader>ñ",function()Acento()end,{desc = "toggle acento"})

-- Remapear @ para activar macros a <leader>q por que @ es incómodo de cojones
vim.keymap.set("n", "<leader>q", "@")
