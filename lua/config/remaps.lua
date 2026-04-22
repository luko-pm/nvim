local vim = vim
-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = 'ñ'

-- jk -> esc
vim.keymap.set('i', 'jk','<esc>')

-- File tree
--vim.keymap.set('n', '<leader>t', vim.cmd.Ex, {desc = "File tree"})
-- Ahora con oil es con -

-- Moving lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- super mega custom hacker shit para poner acento a las letras
-- (así es doña lo he hecho yo con mis manitas, no big deal)
require("config.acentos")
vim.keymap.set("n", "<leader>ñ",function()Acento()end,{desc = "toggle acento"})

-- Remapear @ para activar macros a <leader>q por que @ es incómodo de cojones
vim.keymap.set("n", "<leader>q", "@")

-- Moverse entre splits
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
-- En instert
vim.keymap.set("i", "<A-h>", "<Esc><C-w>h")
vim.keymap.set("i", "<A-j>", "<Esc><C-w>j")
vim.keymap.set("i", "<A-k>", "<Esc><C-w>k")
vim.keymap.set("i", "<A-l>", "<Esc><C-w>l")
-- En terminal
vim.keymap.set("t", "<A-h>", [[<C-\><C-N><C-w>h]])
vim.keymap.set("t", "<A-j>", [[<C-\><C-N><C-w>j]])
vim.keymap.set("t", "<A-k>", [[<C-\><C-N><C-w>k]])
vim.keymap.set("t", "<A-l>", [[<C-\><C-N><C-w>l]])

-- Esc para salir de terminal-mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc = "salir de modo terminal"})

-- Para que funcione lo de el universal clipboard con la config de hyprland. (ver .config/hypr/bindings/clipboard.conf)
vim.keymap.set({"n", "v"}, "<C-Insert>", [["*y]])
--vim.keymap.set({"n", "v"}, "<S-Insert>", [["+p]]) -- esto no hace falta, funciona solo

-- Lo de arriba como que no va así que pongo para pegar normal en insert (como en obsidian)
vim.keymap.set("i", "<C-v>", '<esc>"+p`]a')
