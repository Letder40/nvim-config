-- Diagnostic
vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = {
    prefix = "●",
    virt_text_pos = "right_align",
  }
})
vim.keymap.set('n', '<leader>ee', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<leader>ne', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', '<leader>pe', '<cmd>lua vim.diagnostic.goto_next()<cr>')


-- Autoclose
local ok, autoclose = pcall(require, "autoclose")
if ok then
    autoclose.setup()
else
    print("autoclose not installed")
end

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local lspkind = require('lspkind')

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
