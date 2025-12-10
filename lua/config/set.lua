vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.scrolloff = 5

-- Window borders
vim.opt.winborder = "rounded"

-- El clipboard el el mismo que el predeterminado de el ordenador
--vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Folding
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"

--vim.g.netrw_browse_split = 0
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25

-- para quickscope (no me gusta tenerlo aqui pero tiene que ser antes de inicializar el plugin)
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

vim.opt.conceallevel = 1

-- Idiomas e de texto.
vim.opt.spelllang = "en,es"

-- Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Opciones completion
vim.opt.completeopt = {"fuzzy", "menu", "menuone", "noselect" } -- TODO: Copidados de TJ, elegir los míos


