return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require('nvim-treesitter')
        treesitter.setup {
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

        }
        treesitter.install({ "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "hyprlang" })
    end,
}
