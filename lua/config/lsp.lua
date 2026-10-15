vim.diagnostic.config({
    update_in_insert = false,
})

vim.lsp.config("clangd", {
    filetypes = { "c", "cpp", "c++", "h", "hpp" },
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--enable-config",
        "--offset-encoding=utf-16",
    },
})

vim.lsp.config("oxlint", {
    settings = {
        unusedDisableDirectives = "deny",
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
            }
        }
    }
})

vim.lsp.config("tailwindcss", {
    filetypes = {
        'html', 'mdx', 'javascript', 'typescript', 'javascriptreact',
        'typescriptreact', 'vue', 'svelte', 'rust'
    },
    init_options = {
        userLanguages = {
            rust = "html"
        }
    },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    [[class\s*=\s*\"([^\"]*)\"]],
                    [[clx!\s*\{\s*\"([^\"]*)\"\s*\}]],
                },
            },
        },
    },
})


vim.lsp.config("asm_lsp", {
    filetypes = { "asm", "nasm" },
})

vim.lsp.config("pylsp", {

    filetypes = { 'python' },
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                jedi_completion = { fuzzy = true, include_params = false },
                jedi_signature_help = { enabled = true },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                flake8 = { enabled = true, maxLineLength = 100 },
                pylsp_mypy = { enabled = true },
                yapf = { enabled = true },
            },
        }
    }
})

vim.lsp.config("sqlls", {
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql", "mysql" },
    root_markers = { ".git" },
})

vim.lsp.enable("oxlint")
vim.lsp.enable("sqlls")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufnr = event.buf
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>rb', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>ee', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '<leader>ep', '<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>', opts)
        vim.keymap.set('n', '<leader>en', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>', opts)
    end,
})
