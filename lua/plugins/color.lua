return{
	--{
	--	"folke/tokyonight.nvim",
	--	lazy = true,
	--	opts = { style = "moon" },
	--},

	{ "rose-pine/neovim",
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
            vim.cmd [[colorscheme rose-pine]]
        end,
	},
}
