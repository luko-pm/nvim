return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require('nvim-treesitter')

        treesitter.setup ({})

        treesitter.install({ "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "hyprlang" })
    end,
}
