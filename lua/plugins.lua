return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {"williamboman/mason.nvim"}
	-- Themes 
	use 'navarasu/onedark.nvim'
	-- utils
	use 'm4xshen/autoclose.nvim'
   -- cmp
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'saadparwaiz1/cmp_luasnip'
   use 'hrsh7th/cmp-path'
   use 'L3MON4D3/LuaSnip'
   use 'rafamadriz/friendly-snippets'
   -- lsp0   
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- LSP Support
         {'neovim/nvim-lspconfig'},
         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'L3MON4D3/LuaSnip'},
      }
   }
   use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
   use({
   'ray-x/navigator.lua',
   requires = {
         { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
         { 'neovim/nvim-lspconfig' },
      },
   })
end)
