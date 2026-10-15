return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<A-f>",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },

    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            rust = { "leptosfmt" },
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
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
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
