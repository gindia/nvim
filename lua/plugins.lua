return require'packer'.startup( function()
    use 'wbthomason/packer.nvim'

    -- debs
    use {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }

    -- colorscheme
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    -- syntax
    -- use 'sheerun/vim-polyglot'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- autocomplete
    use {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    }

    -- git
    use 'tpope/vim-fugitive'

    -- where am I !
    use 'romgrk/nvim-treesitter-context'

end)
