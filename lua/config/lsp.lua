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
