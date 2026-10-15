return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            { "https://github.com/Letder40/telescope-file-browser.nvim", branch = "feat/independent-depth-configuration" },
            { 'nvim-telescope/telescope-fzf-native.nvim',                build = 'make' }
        },
        lazy = false,

        config = function()
            local telescope = require "telescope"
            local tc_actions = require "telescope.actions"
            local fb_actions = require "telescope._extensions.file_browser.actions"

            local browser_finder = require "telescope._extensions.file_browser.finders"

            telescope.setup({
                defaults = {
                    mappings = {
                        n = {
                            ["<esc>"] = false,
                            ["q"] = tc_actions.close,
                        },
                    },
                },

                extensions = {
                    file_browser = {
                        path = vim.loop.cwd(),
                        cwd = vim.loop.cwd(),
                        cwd_to_path = false,
                        grouped = false,
                        files = true,
                        file_browser_depth = 1,
                        folder_browser_depth = false,
                        add_dirs = true,
                        auto_depth = true,
                        select_buffer = false,
                        hidden = { file_browser = false, folder_browser = false },
                        respect_gitignore = true,
                        no_ignore = false,
                        follow_symlinks = true,
                        browse_files = browser_finder.browse_files,
                        browse_folders = browser_finder.browse_folders,
                        hide_parent_dir = true,
                        collapse_dirs = false,
                        prompt_path = true,
                        quiet = false,
                        dir_icon = "",
                        dir_icon_hl = "Default",

                        display_stat = {
                            date = true,
                            size = true,
                            mode = true
                        },

                        hijack_netrw = false,
                        use_fd = true,
                        git_status = true,

                        mappings = {
                            ["i"] = {
                                ["<A-c>"] = fb_actions.create,
                                ["<S-CR>"] = fb_actions.create_from_prompt,
                                ["<A-r>"] = fb_actions.rename,
                                ["<A-m>"] = fb_actions.move,
                                ["<A-y>"] = fb_actions.copy,
                                ["<A-d>"] = fb_actions.remove,
                                ["<C-o>"] = fb_actions.open,
                                ["<C-g>"] = fb_actions.goto_parent_dir,
                                ["<C-h>"] = fb_actions.goto_home_dir,
                                ["<C-w>"] = fb_actions.goto_cwd,
                                ["<C-t>"] = fb_actions.change_cwd,
                                ["<C-f>"] = fb_actions.toggle_browser,
                                ["<C-.>"] = fb_actions.toggle_hidden,
                                ["<C-s>"] = fb_actions.toggle_all,
                                ["<bs>"] = fb_actions.backspace,
                            },
                            ["n"] = {
                                ["q"] = tc_actions.close,
                                ["c"] = fb_actions.create,
                                ["r"] = fb_actions.rename,
                                ["m"] = fb_actions.move,
                                ["y"] = fb_actions.copy,
                                ["d"] = fb_actions.remove,
                                ["o"] = fb_actions.open,
                                ["h"] = fb_actions.goto_home_dir,
                                ["w"] = fb_actions.goto_cwd,
                                ["t"] = fb_actions.change_cwd,
                                ["f"] = fb_actions.toggle_browser,
                                ["."] = fb_actions.toggle_hidden,
                                ["s"] = fb_actions.toggle_all,
                            },
                        },
                    },
                },
            })
            telescope.load_extension("file_browser")
        end,

        keys = {
            {
                "<C-p>",
                function() require("telescope.builtin").git_files({ show_untracked = true }) end,
                desc = "Telescope Git Files (con untracked)"
            },
            {
                "<C-f>",
                function() require("telescope.builtin").find_files() end,
                desc = "Telescope Find Files"
            },
            {
                "<C-b>",
                function() require("telescope").extensions.file_browser.file_browser() end,
                desc = "Telescope File Browser"
            },
            {
                "<leader>st",
                function() require("telescope.builtin").treesitter() end,
                desc = "Telescope Treesitter"
            },
            {
                "<leader>ff",
                function() require("telescope.builtin").find_files() end,
                desc = "Telescope Find Files"
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
