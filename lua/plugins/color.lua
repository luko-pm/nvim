return{
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            transparent = true,
        },
    },

    { 
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                background_opacity = 0;
                disable_italics = false,
                --disable_background = true,
                --[[highlight_groups = {
                    TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    TelescopeNormal = { bg = "none" },
                    TelescopePromptNormal = { bg = "base" },
                    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    TelescopeSelection = { fg = "text", bg = "base" },
                    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                },]]--
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            })
            --vim.cmd [[colorscheme rose-pine]]
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            transparent_background = true,
            float = {
                transparent = true,
            },

            integrations = {
                telescope = {
                    enabled = true,
                }
            },
        },

        config = function(_, opts)
            require("catppuccin").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme catppuccin]]
        end,
    },

    --{
    --    "rebelot/kanagawa.nvim",
    --},

    --{
    --    "tiagovla/tokyodark.nvim",
    --    opts = {
    --        transparent_background = true,
    --    },
    --    config = function(_, opts)
    --        require("tokyodark").setup(opts) -- calling setup is optional
    --    end,
    --},
}
