-- nvim-treesitter main uses the native Neovim Tree-sitter API.
-- Keep the plugin eagerly loaded; highlighting is enabled per buffer below.
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "bash", "c", "cpp", "css", "html", "javascript", "json",
            "lua", "markdown", "markdown_inline", "python", "rust",
            "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
        }

        require("nvim-treesitter").install(parsers)

        local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
