return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function ()
    local tdc = require("todo-comments")

        vim.keymap.set("n", "]t", function()
            tdc.jump_next()
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
            tdc.jump_prev()
        end, { desc = "Previous todo comment"})

        vim.keymap.set("n", "<leader>ftd", "<cmd>TodoTelescope<cr>",{desc = "find todo comments"})
    end,
}

