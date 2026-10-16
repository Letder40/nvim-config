return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        lazy = false,

        config = function()
            local telescope = require "telescope"
            local tc_actions = require "telescope.actions"

            telescope.setup({
                defaults = {
                    mappings = {
                        n = {
                            ["<esc>"] = false,
                            ["q"] = tc_actions.close,
                        },
                        i = {
                            ["<C-c>"] = tc_actions.close
                        }
                    },
                },

            })

            telescope.load_extension("fzf")
        end,

        keys = {
            {
                "<C-p>",
                function() require("telescope.builtin").git_files({ show_untracked = true }) end,
                desc = "Telescope Git Files (con untracked)"
            },
            {
                "<leader>ff",
                function() require("telescope.builtin").find_files() end,
                desc = "Telescope Find Files"
            },
            {
                "<leader>fs",
                function() require("telescope.builtin").treesitter() end,
                desc = "Telescope Treesitter"
            },
            {
                "<leader>fb",
                function() require("telescope.builtin").buffers() end,
                desc = "Telescope Buffers"
            },
            {
                "<leader>fg",
                function() require("telescope.builtin").live_grep() end,
                desc = "Telescope Live Grep"
            },
            {
                "<leader>fe",
                function() require("telescope.builtin").diagnostics() end,
                desc = "Telescope Diagnostics"
            },
            {
                "<leader>gc",
                function() require("telescope.builtin").git_commits() end,
                desc = "Telescope Git Commits"
            },
            {
                "<leader>gs",
                function() require("telescope.builtin").git_status() end,
                desc = "Telescope Git Status"
            },
            {
                "<leader>gf",
                function() require("telescope.builtin").git_bcommits() end,
                desc = "Telescope Git Buffer Commits"
            },
            {
                "<leader>gb",
                function() require("telescope.builtin").git_branches() end,
                desc = "Telescope Git Branches"
            },
            {
                "<leader><space>",
                function() require("telescope.builtin").resume() end,
                desc = "Telescope Resume Last Search"
            },
        }
    }
}
