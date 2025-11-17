-- cmp
require("lazydev").setup()
require("autoclose").setup()

local lspkind = require('lspkind')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
    },

    mapping = cmp.mapping.preset.insert ({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),

    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },

    formatting = {
        fields= {"abbr", "kind", "menu"},
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = {
                menu = 30,
                abbr = 30,
            },
            ellipsis_char = "...",
            show_labelDetails = true,
            menu = ({
                nvim_lsp = "[LSP]",
                buffer   = "[BUF]",
                vsnip    = "[SNIP]",
                path     = "[PATH]",
            })
        }),
    }
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    on_attach = on_attach,
    capabilities = capabilities,
})

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

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c" },
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
    assembler = "nasm",
    filetypes = { "nasm", "asm", "s", "S" },
})
