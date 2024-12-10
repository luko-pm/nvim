local myLSPs = {"lua_ls", "pyright", "jdtls"} -- Lista de lsps para mason -> ensure_installed y nvim_cmd (aún así hay que hacer el setup)
return {
    { "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        opts = {
            ensure_installed = myLSPs
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            'hrsh7th/nvim-cmp',-- Autocompletion plugin
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("mason-lspconfig").setup{}
            require("lspconfig").lua_ls.setup{
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            }
            require("lspconfig").pyright.setup{}
            require("lspconfig").jdtls.setup{}
        end,
    },
    {
        'hrsh7th/nvim-cmp',-- Autocompletion plugin
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp,
            'L3MON4D3/LuaSnip', -- Snippets plugin,
        },
        config = function()
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require('lspconfig')

            -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
            local servers = myLSPs
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    -- on_attach = my_custom_on_attach,
                    capabilities = capabilities,
                }
            end

            -- luasnip setup
            local luasnip = require 'luasnip'

            -- nvim-cmp setup
            local cmp = require 'cmp'
            cmp.setup {
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
        end
    },
    --[[ TODO
    {
        'mfussenegger/nvim-jdtls',
        config = function()
        end
    },
    ]]--
}
