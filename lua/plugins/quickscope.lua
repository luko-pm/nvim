return{
    'unblevable/quick-scope',
    config = function ()
        -- vim.cmd[[ highlight QuickScopePrimary   guifg='#FF0000' gui=underline ctermfg=155 cterm=underline]]
        vim.cmd[[ highlight QuickScopePrimary   guifg='#FF0000']]
        vim.cmd[[highlight QuickScopeSecondary  guifg='#ff6B6B']]
    end,
}
