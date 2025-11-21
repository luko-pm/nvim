return{
	'tpope/vim-surround',
    config = function()
        vim.keymap.set("n", "s", "<plug>Ysurround", {desc = "surround"})
        vim.keymap.set("n", "S", "<plug>YSurround", {desc = "surround"})
        vim.keymap.set("n", "ss", "<plug>Yssurround", {desc = "surround"})
        vim.keymap.set("n", "Ss", "<plug>YSsurround", {desc = "surround"})
        vim.keymap.set("n", "SS", "<plug>YSSurround", {desc = "surround"})
        vim.keymap.set("x", "s", "<plug>VSurround", {desc = "surround"})
        vim.keymap.set("x", "gs", "<plug>VgSurround", {desc = "surround"})
    end
}
