return {
    --[[
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        dependencies = {
            'mfussenegger/nvim-dap',
            'hrsh7th/nvim-cmp',-- Autocompletion plugin
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        },
        config = function()
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                local function buf_set_option(...)
                    vim.api.nvim_buf_set_option(bufnr, ...)
                end

                buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
                local opts = { noremap = true, silent = true }

                buf_set_keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
                buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
                buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
                buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                client.server_capabilities.document_formatting = true
            end
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local config = {
                -- The command that starts the language server
                -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
                cmd = {

                    -- 💀
                    "java", -- or '/path/to/java17_or_newer/bin/java'
                    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xmx1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",

                    -- 💀
                    "-jar",
                    vim.fn.expand(
                        "~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
                    ),
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
                    -- Must point to the                                                     Change this to
                    -- eclipse.jdt.ls installation                                           the actual version

                    -- 💀
                    "-configuration",
                    vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls/config_linux"),
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.

                    -- 💀
                    -- See `data directory configuration` section in the README
                    "-data",
                    vim.fn.expand("~/.cache/jdtls/workspace") .. project_name,
                },

                -- 💀
                -- This is the default if not provided, you can remove it. Or adjust as needed.
                -- One dedicated LSP server & client will be started per unique root_dir
                root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

                -- Here you can configure eclipse.jdt.ls specific settings
                -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
                -- for a list of options
                settings = {
                    java = {},
                },

                -- Language server `initializationOptions`
                -- You need to extend the `bundles` with paths to jar files
                -- if you want to use additional eclipse.jdt.ls plugins.
                --
                -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
                --
                -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
                init_options = {
                    bundles = {},
                },
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("jdtls").start_or_attach(config)
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("cmp").setup{
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                    -- C-b (back) C-f (forward) for snippet placeholder navigation.
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }
        end,
    },
    ]]--
}
