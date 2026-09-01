return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            modules = {},
            ignore_install = {},
            ensure_installed = {
                "rust",
                "asm",
                "c",
                "go",
                "zig",
                "lua",
                "python",
                "bash",
                "sql",
                "html",
                "css",
                "typescript",
                "javascript",
                "php",
                "markdown",
                "markdown_inline",
                "cmake"
            },
            sync_install = true,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end
}
