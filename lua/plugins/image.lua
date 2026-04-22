return{
    "3rd/image.nvim",

    -- ↓ Esto hace que de error de algo de lo de magick rocks
    -- version = "1.1.0", -- less braking, check molten docs for last supportd version

    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239

    config = function()
        require("image").setup({
            backend = "kitty",
            processor = "magick_cli",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    only_render_image_at_cursor_mode = "popup", -- or "inline"
                    floating_windows = false,
                    filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                }
            },
            max_height = 100,
            max_width  = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", ""},

        })
    end
}
