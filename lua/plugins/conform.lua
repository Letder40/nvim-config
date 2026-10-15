return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            rust = { "leptosfmt" },
            lua = { "stylua" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },

        formatters = {
            leptosfmt = {
                command = "leptosfmt",
                args = { "--stdin", "--rustfmt" },
            },
        },
    },
}
