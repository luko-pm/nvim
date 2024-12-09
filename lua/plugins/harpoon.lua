return{
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		vim.keymap.set("n", "<leader>hh", function() harpoon:list():add() end, {desc = "harpoon add"})
		vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "harpoon toggle menu"})

		vim.keymap.set("n", "<leader>a", function() harpoon:list():select(1) end, {desc = "harpoon 1"})
		vim.keymap.set("n", "<leader>s", function() harpoon:list():select(2) end, {desc = "harpoon 2"})
		vim.keymap.set("n", "<leader>d", function() harpoon:list():select(3) end, {desc = "harpoon 3"})
		vim.keymap.set("n", "<leader>f", function() harpoon:list():select(4) end, {desc = "harpoon 4"})
	end,
}
