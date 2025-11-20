return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
            config = function ()
                local mason = require("mason")
                mason.setup({
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                })
            end
        },
        "neovim/nvim-lspconfig",
    },
    config = function ()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "bashls",
                "html",
                "ts_ls"
            },

            automatic_enable = true,
        })
    end,
}
