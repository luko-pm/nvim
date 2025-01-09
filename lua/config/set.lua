vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.scrolloff = 5

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

--vim.g.netrw_browse_split = 0
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25

-- para quickscope (no me gusta tenerlo aqui pero tiene que ser antes de inicializar el plugin)
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

vim.opt.conceallevel = 1

-- para colapsar código en función de la indentación
vim.opt.foldmethod = "indent"
