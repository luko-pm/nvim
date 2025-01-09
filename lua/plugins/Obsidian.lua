return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/Vault/*.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/Vault/*.md",

        "BufReadPre " .. "/mnt/c/Users/tomay/A/Vault/*.md",
        "BufNewFile " .. "/mnt/c/Users/tomay/A/Vault/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter",
    },
    opts = {
        workspaces = {
            {
                name = "Vault",
                path = "~/Vault",
            },
            {
                name = "Vault",
                path = "/mnt/c/Users/tomay/A/Vault",
            },
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<cr>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            },
            ["<leader>on"] = { action = function()
                return require("obsidian").commands.ObsidianNew({data = vim.fn.input("name for the new note: ")})
            end
            },
        },

        -- Optional, customize how note IDs are generated given an optional title.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                return title
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,

        prefered_link_style = "wiki",

        templates = {
            folder = "templates",
            date_format = "%d-%m-%Y",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
        },
        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            -- vim.fn.jobstart({"xdg-open", url})  -- linux
            vim.ui.open(url) -- need Neovim 0.10.0+
        end,

        ---@param img string
        follow_img_func = function(img)
            -- no se como se hace esto...
        end,

        use_advanced_uri = false, -- TODO: Check out https://github.com/Vinzent03/obsidian-advanced-uri

        picker = {
            name = "telescope.nvim",
            -- Optional, configure key mappings for the picker. These are the defaults.
            -- Not all pickers support all mappings.
            note_mappings = {
                -- Create a new note from your query.
                new = "<C-x>",
                -- Insert a link to the selected note.
                insert_link = "<C-l>",
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = "<C-x>",
                -- Insert a tag at the current location.
                insert_tag = "<C-l>",
            },
        },

        sort_by = "modified",
        sort_reversed = true,

        -- Set the maximum number of lines to read from notes on disk when performing certain searches.
        search_max_lines = 1000,

        open_notes_in = "current",

        -- Optional, define your own callbacks to further customize behavior.
        callbacks = {
            -- Runs at the end of `require("obsidian").setup()`.
            ---@param client obsidian.Client
            post_setup = function(client) end,

            -- Runs anytime you enter the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            enter_note = function(client, note) end,

            -- Runs anytime you leave the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            leave_note = function(client, note) end,

            -- Runs right before writing the buffer for a note.
            ---@param client obsidian.Client
            ---@param note obsidian.Note
            pre_write_note = function(client, note) end,

            -- Runs anytime the workspace is set/changed.
            ---@param client obsidian.Client
            ---@param workspace obsidian.Workspace
            post_set_workspace = function(client, workspace) end,
        },

        ui = {
            enable = true,  -- set to false to disable all additional syntax features
            update_debounce = 200,  -- update delay after a text change (in milliseconds)
            max_file_length = 5000,  -- disable UI features for files with more than this many lines
            -- Define how various check-boxes are displayed
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["!"] = { char = "", hl_group = "ObsidianImportant" },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#d73128" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },
        attachments = {
            -- The default folder to place images in via `:ObsidianPasteImg`.
            -- You can always override this per image by passing a full path to the command instead of just a filename.
            img_folder = "assets/imgs",  -- This is the default

            -- A function that determines the text to insert in the note when pasting an image.
            -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
            -- This is the default implementation.
            ---@param client obsidian.Client
            ---@param path obsidian.Path the absolute path to the image file
            ---@return string
            img_text_func = function(client, path)
                path = client:vault_relative_path(path) or path
                return string.format("![%s](%s)", path.name, path)
            end,
        },
    }
}
