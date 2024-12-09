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
				--disable_background = true,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	}
}
