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
                    ensure_installed = {"lua_ls","hls","clangd","pyright"},
                }
            },
            "onsails/lspkind.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "j-hui/fidget.nvim",

            --"stevearc/conform.nvim",
            -- TODO: Mirar supermaven, es ia en plan copilot
        },

        config = function ()

            require("fidget").setup({})

            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_lsp.default_capabilities()

            -- Lista de lsp's que configurar con default_capabilities
            local lsp_servers = {'lua_ls', 'hyprls', 'haskell', 'pyright', 'clangd', }

            for _, server in ipairs(lsp_servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end

            --[[
            vim.lsp.config('lua_ls', { capabilities = capabilities })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('hyprls', { capabilities = capabilities })
            vim.lsp.enable('hyprls')

            vim.lsp.config('haskell', { capabilities = capabilities })
            vim.lsp.enable('haskell')

            vim.lsp.config('pyright', { capabilities = capabilities })
            vim.lsp.enable('pyright')

            vim.lsp.config('clangd', { capabilities = capabilities })
            vim.lsp.enable('clangd')
            ]]--

        end
    }
}
