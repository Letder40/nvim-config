-- lsp-preconfigured with lsp-zero
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- autoclose
require("autoclose").setup()

-- cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp.defaults.cmp_mappings({
   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
   ['<C-Space>'] = cmp.mapping.complete(),
})

require("autoclose").setup()

require 'navigator'.setup({
   lsp = {
      format_on_save = false
   }
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

-- No lsp-zero 
--
local lspconfig = require("lspconfig")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

local lspconfig = require("lspconfig")
require 'navigator'.setup({
    lsp = {
        enable = true,
        format_on_save = false
    },
    mason = true,
    on_attach = on_attach,
    treesitter_analysis = true,
})

require("mason-lspconfig").setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,

    ["clangd"] = function()
        lspconfig.clangd.setup {
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
        }
    end,

    ["asm_lsp"] = function()
        lspconfig.asm_lsp.setup {
            assembler = "nasm",
            filetypes = { "nasm", "asm", "s", "S" },
            root_dir = lspconfig.util.root_pattern(".git", "."),
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
}
