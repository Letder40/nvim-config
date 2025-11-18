return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        "mason-org/mason-lspconfig.nvim",
        requires = {
            { 'williamboman/mason.nvim' },
            { 'neovim/nvim-lspconfig' },
        }
    }
    use "folke/lazydev.nvim"
    -- cmp
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'f3fora/cmp-spell'
    use 'onsails/lspkind.nvim'
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
    -- Themes
    use 'navarasu/onedark.nvim'
    -- utils
    use 'sontungexpt/better-diagnostic-virtual-text' -- better diagnostics
    use 'm4xshen/autoclose.nvim' -- tags
    use 'folke/zen-mode.nvim'    -- zz
    use "editorconfig/editorconfig-vim" -- .editorconfig
    -- LSP
    use 'nanotee/sqls.nvim' -- sqls
    -- lsp integrations
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    -- LSP or others
    use 'lervag/vimtex' -- latex
    use 'nanotee/sqls.nvim' -- sqls
    -- lsp integrations
    use({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    })
    -- navegation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-tree/nvim-web-devicons'}
        }
    }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {"nvim-lua/plenary.nvim"}
    }
end)
