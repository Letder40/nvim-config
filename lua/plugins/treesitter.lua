return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    branch = "main",
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter")

        local parsers = {
            "asm",
            "zig",
            "c",
            "cpp",
            "rust",
            "go",
            "cmake",
            "python",
            "lua",
            "typescript",
            "javascript",
            "bash",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "sql",
        }

        treesitter.setup({})
        treesitter.install(parsers)

        local filetypes = {
            "rust",
            "asm",
            "c",
            "go",
            "zig",
            "lua",
            "python",
            "sh",
            "sql",
            "html",
            "css",
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
            "php",
            "markdown",
            "cmake",
        }

        local group = vim.api.nvim_create_augroup(
            "treesitter-start",
            { clear = true }
        )

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = filetypes,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
