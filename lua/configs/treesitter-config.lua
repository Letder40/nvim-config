require('nvim-treesitter.configs').setup({
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
        "php"
    },
    sync_install = true,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
