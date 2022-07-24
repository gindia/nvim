return require'packer'.startup( function()
    use 'wbthomason/packer.nvim'

    -- debs
    use {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }

    -- colorscheme
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }

    -- git
    use 'tpope/vim-fugitive'

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- where am I !
    use 'romgrk/nvim-treesitter-context'

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- autocomplete
    use 'quangnguyen30192/cmp-nvim-tags'
    use 'delphinus/cmp-ctags'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

end)
