local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>ee', '<cmd>lua vim.diagnostic.open_float()<cr>')
    vim.keymap.set('n', '<leader>ne', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    vim.keymap.set('n', '<leader>pe', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "c++", "h", "hpp" },
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--enable-config",
        "--offset-encoding=utf-16",
        "--log=verbose",
    },
})

vim.lsp.config("asm_lsp", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "asm", "nasm" },
})

vim.lsp.config("pylsp", {
    on_attach = on_attach,
    filetypes = { 'python' },
    settings = {
        pylsp = {
            configurationSources = { "flake8" },

            plugins = {
                jedi_completion = {
                    fuzzy = true,
                    include_params = false,
                },

                jedi_signature_help = {
                    enabled = true,
                },

                pyflakes = {
                    enabled = false,
                },

                pycodestyle = {
                    enabled = false,
                },

                mccabe = {
                    enabled = false,
                },

                flake8 = {
                    enabled = true,
                    maxLineLength = 100,
                },

                pylsp_mypy = {
                    enabled = true,
                },

                yapf = {
                    enabled = true,
                },
            },
        }
    }
})

vim.lsp.config("sqlls", {
    cmd = { "sql-language-server", "up", "--method", "stdio" },

    filetypes = { "sql", "mysql" },

    root_markers = {
        ".git",
    },

})

vim.lsp.config("eslint", {
    capabilities = capabilities,
    on_attach = on_attach,
    root_markers = {
        "eslint.config.mjs",
        "eslint.config.js",
        "package.json",
        "bun.lock",
        ".git",
    },
    settings = {
        workingDirectory = { mode = "auto" },
        useFlatConfig = true,
        validate = "on",
        packageManager = "bun",
    },
})

vim.lsp.enable("sqlls")
vim.lsp.enable("eslint")
