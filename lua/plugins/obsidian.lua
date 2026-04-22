return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    -- ft = "markdown",

    -- event = {
    --     "BufReadPre /home/luko/Vault/*.md",
    --     "BufNewFile /home/luko/Vault/*.md",
    -- },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        'nvim-telescope/telescope.nvim',
        "nvim-treesitter/nvim-treesitter",
    },

    config = function()

        if vim.g.obsidianMode == nil then
            return
        end

        vim.keymap.set('n','j','gj')
        vim.keymap.set('n','k','gk')

        local obsidian = require("obsidian")
        obsidian.setup {
            legacy_commands = false,

            workspaces = { { name = "Vault", path = "~/Vault", }, },

            notes_subdir = "01_Inbox",
            new_notes_location = "notes_subdir",

            note_id_func = function(title)
                if title ~= nil then
                    return title
                else
                    return "untitled"
                end
            end,

            templates = {
                folder = "templates",
                date_format = "%d-%m-%Y",
                time_format = "%H:%M",
            },

            footer = {
                enabled = false,
                separator = "", -- insert a blank line
                --format = "{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars", -- works like the template system
                format = "({{backlinks}} backlinks)", -- limit to backlinks
            },

            completion = (function()
                local has_nvim_cmp, _ = pcall(require, "cmp")
                local has_blink = pcall(require, "blink.cmp")
                return {
                    nvim_cmp = has_nvim_cmp and not has_blink,
                    blink = has_blink,
                    min_chars = 0,
                    match_case = true,
                    create_new = true,
                }
            end)(),

            picker = {
                name = "telescope.nvim",
                note_mappings = {
                    new = "<C-x>",
                    insert_link = "<C-l>",
                },
                tag_mappings = {
                    tag_note = "<C-x>",
                    insert_tag = "<C-l>",
                },
            },

            callbacks = {
                enter_note = function(note)
                    vim.keymap.set("n", "<Tab>", function()
                        require("obsidian.api").nav_link "next"
                    end,
                    {buffer = true, desc = "Go to next link",})

                    vim.keymap.set("n", "<S-Tab>", function()
                        require("obsidian.api").nav_link "prev"
                    end,
                    {buffer = true, desc = "Go to previous link",})

                end,
            },

            -- Specify how to handle attachments.
            attachments = {
                -- The default folder to place images in
                -- You can override this per image by passing a full path to the command.
                folder = "Attachments",
            },

            ui = {
                enable = true,
                ignore_conceal_warn = true,
            }
        }
    end,
}
