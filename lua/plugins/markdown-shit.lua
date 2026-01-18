return{
    {
        'Thiago4532/mdmath.nvim',
        ft = "markdown",

        dependencies = {'nvim-treesitter/nvim-treesitter'},

        opts = {
            filetypes = {'markdown'},
            -- Color of the equation, can be a highlight group or a hex color.
            -- Examples: 'Normal', '#ff0000'
            foreground = 'Normal',
            anticonceal = true,
            hide_on_insert = true,
            dynamic = true,
            dynamic_scale = 1.0,
            update_interval = 400,
            internal_scale = 1.0,
        }
    },
    {
        'antonk52/markdowny.nvim',
        config = function()
            require('markdowny').setup()
        end
    }
}
