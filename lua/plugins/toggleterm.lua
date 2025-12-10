return{
      'akinsho/toggleterm.nvim',
      version = "*",
      -- opts = {},
      config = function ()
        require("toggleterm").setup{
            size = 20,
            open_mapping = [[<C-º>]],
        }
      end
}
