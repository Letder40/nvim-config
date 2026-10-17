return {
    {
        "saghen/blink.cmp",

        dependencies = {
            "saghen/blink.lib",
            -- optional: provides snippets for the snippet source
            "rafamadriz/friendly-snippets",
        },
        build = function()
            require("blink.cmp").build():pwait()
        end,

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            appearance = {
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",

                kind_icons = {
                    Text = "󰉿",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "󰒓",

                    Field = "󰜢",
                    Variable = "󰆦",
                    Property = "󰖷",

                    Class = "󱡠",
                    Interface = "󱡠",
                    Struct = "󱡠",
                    Module = "󰅩",

                    Unit = "󰪚",
                    Value = "󰦨",
                    Enum = "󰦨",
                    EnumMember = "󰦨",

                    Keyword = "󰻾",
                    Constant = "󰏿",

                    Snippet = "󰗧",
                    Color = "󰏘",
                    File = "󰈔",
                    Reference = "󰬲",
                    Folder = "󰉋",
                    Event = "󱐋",
                    Operator = "󰪚",
                    TypeParameter = "󰬛",
                },
            },
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = "default",
                ["<C-l>"] = { "hide", "fallback" },
            },

            completion = {
                documentation = {
                    auto_show = true,
                },
                trigger = {
                    show_on_backspace = true,
                },
            },

            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = false } },
            },

            -- (Default) list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = { default = { "lazydev", "lsp", "path", "snippets", "buffer" } },
            fuzzy = { implementation = "rust" },
        },
    },
    {
        {
            "saghen/blink.pairs",
            dependencies = "saghen/blink.lib",

            version = "*",
            build = function()
                require("blink.pairs").download():pwait(60000)
            end,

            init = function()
                vim.api.nvim_set_hl(0, "BlinkPairsWhite", { ctermfg = 12, fg = "#ccc6cb", default = true })

                local function set_highlights()
                    vim.api.nvim_set_hl(0, "BlinkPairsBlue", { ctermfg = 12, fg = "#033f6f", default = true })
                    vim.api.nvim_set_hl(0, "BlinkPairsOrange", { ctermfg = 15, fg = "#d65d0e", default = true })
                    vim.api.nvim_set_hl(0, "BlinkPairsPurple", { ctermfg = 13, fg = "#33134a", default = true })
                    vim.api.nvim_set_hl(0, "BlinkPairsUnmatched", { ctermfg = 9, fg = "#ff003c", default = true })
                    vim.api.nvim_set_hl(0, "BlinkPairsMatchParen", { link = "MatchParen", default = true })
                end

                set_highlights()
                vim.api.nvim_create_autocmd("ColorScheme", {
                    group = vim.api.nvim_create_augroup("blink_pairs_highlights", {}),
                    callback = set_highlights,
                })
            end,
            --- @module 'blink.pairs'
            --- @type blink.pairs.Config
            opts = {
                mappings = {
                    -- you can call require("blink.pairs.mappings").enable()
                    -- and require("blink.pairs.mappings").disable()
                    enabled = true,
                    cmdline = true,
                    -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
                    -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
                    disabled_filetypes = {},
                    wrap = {
                        -- move closing pair via motion
                        ["<C-b>"] = "motion",
                        -- move opening pair via motion
                        ["<C-S-b>"] = "motion_reverse",
                        -- set to 'treesitter' or 'treesitter_reverse' to use treesitter instead of motions
                        -- set to nil, '' or false to disable the mapping
                        -- for normal mode mappings, only supports 'motion' and 'motion_reverse'
                        -- normal_mode = {}
                    },
                    -- see the defaults:
                    -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L52
                    pairs = {},
                },
                highlights = {
                    enabled = true,
                    -- requires require('vim._core.ui2').enable({}), otherwise has no effect
                    cmdline = true,
                    -- set to { 'BlinkPairs' } to disable rainbow highlighting
                    groups = { "", "BlinkPairsBlue", "BlinkPairsOrange", "BlinkPairsPurple" },
                    unmatched_group = "BlinkPairsUnmatched",

                    -- highlights matching pairs under the cursor
                    matchparen = {
                        enabled = true,
                        -- known issue where typing won't update matchparen highlight, disabled by default
                        cmdline = false,
                        -- also include pairs not on top of the cursor, but surrounding the cursor
                        -- optionally only for the given token types, which must be a subset of `enabled`,
                        -- if defined
                        include_surrounding = false,
                        group = "BlinkPairsMatchParen",
                        priority = 250,
                    },
                },
                debug = false,
            },
        },
    },
}
