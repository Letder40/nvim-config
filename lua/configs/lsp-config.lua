-- lsp-preconfigured with lsp-zero
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp.defaults.cmp_mappings({
   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
   ['<C-Space>'] = cmp.mapping.complete(),
})

local cmp_format = require('lsp-zero').cmp_format()
cmp.setup({
   sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
   },
  --- Show source name in completion menu
  formatting = cmp_format,
})

-- LSP
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
lspconfig.html.setup({})
lspconfig.htmx.setup({})
