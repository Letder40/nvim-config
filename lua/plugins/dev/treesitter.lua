return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },

        ensure_installed = "all",
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<nop>",
                node_decremental = "<bs>",
            },
        },
    },
}
