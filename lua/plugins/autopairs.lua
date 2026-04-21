return{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local autopairs = require('nvim-autopairs')
        local rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        autopairs.setup({})

        autopairs.add_rules(
            {
                rule("**","**","markdown")
                :with_pair(cond.not_after_regex("."))
                :with_cr(cond.none())
            }
        )
        -- No se por que cuando pongo las dos rules bajo el mismo add_rules como que no fufa
        autopairs.add_rules(
            {
                rule("_","_","markdown")
                :with_pair(cond.not_after_regex("."))
                :with_cr(cond.none())
            }
        )

    end
}
