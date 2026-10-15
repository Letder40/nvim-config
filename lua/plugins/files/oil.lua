return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,

    config = function()
        require("oil").setup({
            default_file_explorer = true,

            columns = {
                "icon",
            },

            win_options = {
                signcolumn = "yes",
                cursorcolumn = false,
            },

            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden_file = function(name, bufnr)
                    return false
                end,
            },

            float = {
                padding = 2,
                max_width = 80,
                max_height = 0.5,
                border = "rounded",
            },

            skip_confirm_for_simple_edits = true,
            lsp_file_methods = {
                enabled = true,
                timeout_ms = 1000,
                autosave_changes = false,
            },

            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<A-p>"] = "actions.preview",
                ["<leader>c"] = { "actions.cd", mode = "n" },
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
            },

            use_default_keymaps = false,
        })
    end,
}
