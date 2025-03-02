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

local lspkind = require('lspkind')
cmp.setup({
   sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
   },

   formatting = {
    format = lspkind.cmp_format({
      maxwidth = {
        menu = 50, -- leading text (labelDetails)
        abbr = 50, -- actual suggestion item
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- ...
        return vim_item
      end
    })
  }
})

-- LaTex 
lsp.configure("texlab")

-- MD
lsp.configure("lemminx") -- xml

-- WEB
lsp.configure("html")
lsp.configure("htmx")
lsp.configure("cssls")
lsp.configure("phpactor")
lsp.configure("vtsls")
lsp.configure("eslint")
lsp.configure("tailwindcss")

-- Interpreted
lsp.configure("pyright")
lsp.configure("powershell_es")

-- Compiled
lsp.configure("asm_lsp")
lsp.configure("clangd")
lsp.configure("rust_analyzer")
lsp.configure("gopls")

-- No lsp-zero 
--
 local lspconfig = require("lspconfig")

lspconfig.powershell_es.setup({
   filetypes = {"ps1", "psm1", "psd1"},
   bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services.ps1",
   init_options = {
     enableProfileLoading = false,
   },
})
