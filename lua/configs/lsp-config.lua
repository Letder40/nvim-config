vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

        -- these will be buffer-local keybindings

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
})

-- Autoclose
local ok, autoclose = pcall(require, "autoclose")
if ok then
    autoclose.setup()
else
    print("autoclose not installed")
end

-- CMP setup
local cmp = require('cmp')

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
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
        }),
    })
else
    print("lspkind not installed")
end


local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    vim.lsp.config[server] = {
        settings = {
            capabilities = lsp_capabilities,
        }
    }
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

--require('mason-lspconfig').setup({
--    ensure_installed = {
--        'rust_analyzer',
--        'clangd',
--        'gopls',
--        'lemminx',
--        'lua_ls',
--        'pyright',
--        'sqls',
--        'vtsls',
--    },
--    handlers = {
--        default_setup,
--    },
--})

-- Navigator for enhanced LSP UI
vim.schedule(function()
    local ok, navigator = pcall(require, "navigator")
    if ok then
        navigator.setup({
            lsp = {
                enable = true,
                format_on_save = false
            },
            mason = true,
            treesitter_analysis = true,
        })
    else
        print("navigator not installed")
    end
end)
