return {
    'nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        'cmp-vsnip',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
    },
    config = function ()
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local lspkind = require('lspkind')

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "vsnip" },
                { name = "buffer" },
                { name = "path" }
            },

            mapping = cmp.mapping.preset.insert ({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),

            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

            formatting = {
                fields= {"abbr", "kind", "menu"},
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = {
                        menu = 30,
                        abbr = 30,
                    },
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    menu = ({
                        nvim_lsp = "[LSP]",
                        buffer   = "[BUF]",
                        vsnip    = "[SNIP]",
                        path     = "[PATH]",
                    })
                }),
            }
        })
    end
}
