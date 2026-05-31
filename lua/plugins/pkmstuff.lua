return
{
    { 
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        image = { enabled = true },
        keymap = { enabled = true },
        },
    },



    {
        "OXY2DEV/markview.nvim",
        lazy = false,

        -- Completion for `blink.cmp`
        dependencies = { "saghen/blink.cmp" },
    },

--    {
--        Snacks.keymap.set("n", "g<CR>", function()
--            vim.lsp.buf.code_action({
--                apply = true,
--            })
--            vim.lsp.buf.definition()
--        end, { ft = "markdown"} )
--    }
}
