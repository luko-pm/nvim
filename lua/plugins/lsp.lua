return{
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            --    "folke/lazydev.nvim",
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup()
                end
            },
            {
                "mason-org/mason-lspconfig.nvim",
                dependencies = {"mason-org/mason.nvim"},
                opts = {
                    ensure_installed = {"lua_ls",},
                }
            },
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",

            --"stevearc/conform.nvim",
            -- TODO: Mirar supermaven, es ia en plan copilot
        },

        config = function ()

            -- DESACTIVADO TEMPORALMENTE POR QUE TENGO QUE ESTUDIAR Y ME MOLESTA, CONFIGURALO BIEN YA COÑO JODER
            -- if true then
            --     return
            -- end





            -- ????? esto es de TJ. TODO: estudiar setup de obsidian + nvim TJ
            -- -- Don't do LSP stuff if we're in Obsidian Edit mode
            -- if vim.g.obsidian then
            --     return
            -- end

            require("fidget").setup({})

            local cmp = require('cmp')
            local cmp_lsp = require('cmp_nvim_lsp')
            local luasnip = require("luasnip")

            cmp.setup({

                view = {
                    docs = {
                        auto_open = true,
                    }
                },

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),

                    --['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item. 
                    --Set `select` to `false` to only confirm explicitly selected items.

                    -- Aceptar
                    ["<C-y>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.mapping.confirm {
                                    behavior = cmp.ConfirmBehavior.Insert,
                                    select = true,
                                }
                            end
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    --[[
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.mapping.confirm {
                                    behavior = cmp.ConfirmBehavior.Insert,
                                    select = true,
                                }
                            end
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ]]--

                    -- Siguiente 
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item{ behavior = cmp.SelectBehavior.Insert }
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item{ behavior = cmp.SelectBehavior.Insert }
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- Anterior
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item{ behavior = cmp.SelectBehavior.Insert }
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item{ behavior = cmp.SelectBehavior.Insert }
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    -- { name = "copilot", group_index = 2 },
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                })
            })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })


            -- Set up lspconfig.
            local capabilities = cmp_lsp.default_capabilities()

            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            vim.lsp.config('lua_ls', {
                capabilities = capabilities
            })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('hyprls', {
                capabilities = capabilities
            })

            vim.lsp.enable('hyprls')

        end
    }
}
