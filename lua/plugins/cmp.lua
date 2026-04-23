local function cmp_insert_keymap(cmp, luasnip)
    cmp.mapping(function(fallback)
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
    end, { "i", "s" })
end

local function cmp_next_keymap(cmp, luasnip)
    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item{
                behavior = cmp.SelectBehavior.Insert
            }
        elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end, { "i", "s" })
end

local function cmp_prev_keymap(cmp, luasnip)
    return cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item{ behavior = cmp.SelectBehavior.Insert }
        elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" })
end

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function ()

            local cmp = require('cmp')
            local luasnip = require("luasnip")

            cmp.setup(
                {
                    view = {
                        docs = {
                            auto_open = true,
                        }
                    },

                    snippet = { expand = function(args)
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
                    ["<C-y>"] = cmp_insert_keymap(cmp, luasnip),
                    -- ['<CR>'] = cmp_insert_keymap,
                    -- Siguiente 
                    ["<Tab>"] = cmp_next_keymap(cmp, luasnip),
                    ["<C-n>"] = cmp_next_keymap(cmp, luasnip),
                    -- Anterior
                    ["<S-Tab>"] = cmp_prev_keymap(cmp, luasnip),
                    ["<C-p>"] = cmp_prev_keymap(cmp, luasnip),
                }),

                sources = cmp.config.sources({
                    -- { name = "copilot", group_index = 2 },
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    {
                        name = function()
                            if vim.g.obsidianMode == nil then
                                return 'buffer'
                            end
                        end
                    },
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

        end

    }

}
