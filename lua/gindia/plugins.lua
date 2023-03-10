return require'packer'.startup( function()
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-dispatch'

    -- debs
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- colorscheme
    use "savq/melange-nvim"
    use 'folke/tokyonight.nvim'

    -- syntax and shit
    use "sheerun/vim-polyglot"

    -- lsp
    -- use 'neovim/nvim-lspconfig'

    -- Treesitter
    --use 'nvim-treesitter/nvim-treesitter'

    -- where am I !
    --use 'romgrk/nvim-treesitter-context'

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- autocomplete
    -- use 'ms-jpq/coq_nvim'
    -- use 'ms-jpq/coq.artifacts'
    -- use 'ms-jpq/coq.thirdparty'
end)
