return require'packer'.startup( function()
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-dispatch'

    -- debs
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- colorscheme
    use "savq/melange-nvim"

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- where am I !
    use 'romgrk/nvim-treesitter-context'

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- autocomplete
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'

    -- use 'quangnguyen30192/cmp-nvim-tags'
    -- use 'delphinus/cmp-ctags'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-omni'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/nvim-cmp'

    -- snippets
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'L3MON4D3/LuaSnip'
end)
