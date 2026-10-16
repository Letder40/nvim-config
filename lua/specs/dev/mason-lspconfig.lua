return {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    opts = {
        ensure_installed = {
            "clangd",
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
        },

        automatic_enable = true,
    },
}
