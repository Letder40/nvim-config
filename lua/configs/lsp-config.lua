-- lsp-zero
local ok, lsp = pcall(require, "lsp-zero")
if not ok then
    print("lsp-zero not installed")
    return
end
lsp.preset("recommended")

-- Autoclose
local ok, autoclose = pcall(require, "autoclose")
if ok then
    autoclose.setup()
else
    print("autoclose not installed")
end

-- CMP setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

-- LSP Kind for CMP formatting
local ok, lspkind = pcall(require, "lspkind")
if ok then
    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "buffer" },
        },
        formatting = {
            format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = '...',
                show_labelDetails = true,
                before = function(entry, vim_item)
                    return vim_item
                end
            })
        }
    })
else
    print("lspkind not installed")
end

-- Mason for LSP server management
local ok, mason = pcall(require, "mason")
if ok then
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
else
    print("mason not installed")
end

-- Navigator for enhanced LSP UI
local ok, navigator = pcall(require, "navigator")
if ok then
    navigator.setup({
        lsp = {
            enable = true,
            format_on_save = false
        },
        mason = true,
        on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
        treesitter_analysis = true,
    })
else
    print("navigator not installed")
end

-- LSP server configurations
lsp.configure('clangd', {
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
    filetypes = { "c" },
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--enable-config",
        "--offset-encoding=utf-8",
        "--log=verbose",
    },
})

lsp.configure('asm_lsp', {
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
    filetypes = { "nasm", "asm", "s", "S" },
    root_dir = require('lspconfig.util').root_pattern(".git", "."),
})

-- Apply lsp-zero settings
lsp.setup()
