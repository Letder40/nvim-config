return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {"williamboman/mason.nvim"}
	-- Themes 
	use 'navarasu/onedark.nvim'
	-- utils
	use 'm4xshen/autoclose.nvim'
   -- cmp
   use 'L3MON4D3/LuaSnip'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'ray-x/cmp-treesitter'
   use 'f3fora/cmp-spell'

   use {
      'hrsh7th/cmp-vsnip',
      after = 'nvim-cmp',
      requires = {
         'hrsh7th/vim-vsnip',
         {
            'rafamadriz/friendly-snippets',
            after = 'cmp-vsnip'
         }
      }
   }

   use 'L3MON4D3/LuaSnip'

   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},
         -- LSP Support
         {'neovim/nvim-lspconfig'},
      }
   }

   -- lsp integrations
   use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
   use({
   'ray-x/navigator.lua',
   requires = {
         { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
         { 'neovim/nvim-lspconfig' },
      },
   })
   -- navegation
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = {
         {'nvim-lua/plenary.nvim'},
         {'nvim-tree/nvim-web-devicons'}
      }
   }
   use ("theprimeagen/harpoon")
end)
