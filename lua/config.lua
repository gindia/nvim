local cmd = vim.cmd -- exec commands - cmd('cmd')
local map = vim.api.nvim_set_keymap

vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.mapleader = " "
map('', '<leader>w', '<C-w>', { noremap = true })

map('', '<C-n>', '<cmd>Explore<CR>', { noremap = true, silent = true })
map('', '<leader>bd', '<cmd>%bd!|e#<CR>', { noremap = true, silent = true })

cmd("set keywordprg=")
map('', 'K', '<NOP>', { noremap = true })
map('', '<S-Q>', '<NOP>', { noremap = true }) -- disable ex mode

-- remove trailing whitespace
cmd("autocmd BufWritePre * :silent! %s/\\s\\+$//e")

-- nav impovements
map('n', 'Y', 'y$', { noremap = true })

map('i', ',', ',<c-g>u', { noremap = true })
map('i', '.', '.<c-g>u', { noremap = true })
map('i', '!', '!<c-g>u', { noremap = true })
map('i', '?', '?<c-g>u', { noremap = true })
map('n', '<leader>j', "<cmd>m .+1<CR>==", { noremap = true })
map('n', '<leader>k', "<cmd>m .-2<CR>==", { noremap = true })

-- disable numbers in terminal
cmd('autocmd TermOpen * setlocal nonumber')
cmd('autocmd TermOpen * setlocal nospell')

-- opts
cmd("set mouse=a")

cmd("set termguicolors")
cmd("set splitbelow")
cmd("set splitright")
cmd("set nohlsearch")
cmd("set scrolloff=10")
cmd("set sidescrolloff=10")
cmd("set scrollback=100000")
cmd("set nowrap")
cmd("set expandtab")
cmd("set smarttab")
cmd("set tabstop=4 shiftwidth=4")
cmd("set softtabstop=4")
cmd("set autoindent")
cmd("set smartindent")
cmd("set shiftround")
cmd("set hidden")
cmd("set noswapfile")
cmd("set nobackup")
cmd("set nowritebackup")
cmd("set nospell")
cmd("set incsearch")

cmd("set colorcolumn=100")

cmd("set cursorline")
cmd("set cursorcolumn")

cmd("set autowriteall");
cmd("set noshowmode")
cmd("set updatetime=100")
cmd("set shortmess+=c")

cmd("set signcolumn=number")
cmd("set number")

cmd("set foldmethod=marker")

vim.cmd([[set wildmenu]])
vim.cmd([[set wildmode=full]])

vim.cmd([[set statusline=]])
vim.cmd([[set statusline+=\ %F\ %M\ %Y\ %R]])
vim.cmd([[set statusline+=%=]])
vim.cmd([[set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%]])
vim.cmd([[set laststatus=2]])

require 'plugins'

vim.o.background = 'dark'
vim.g.gruvbox_bold = true
vim.g.gruvbox_italic = false
vim.g.gruvbox_invert_selection = false
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_transparent_bg = true

vim.cmd([[colorscheme gruvbox]])

require 'lsp_conf'

-- telescope conf {{{
require('telescope').setup {
    defaults = {
        file_sorter    = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix  = '>>',
        color_devicons = true,

        -- preview = true,
        file_previewer   = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer   = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
        },
    }
}

-- require('telescope').load_extension('fzf')

local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>lua require"telescope.builtin".grep_string()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Telescope builtin<CR>', opt)
-- }}}

-- treesitter {{{
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "comment", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },
}
-- }}}

-- quickfix {{{

toggle_qf = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end

    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    if not
        vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd "copen"
    end
end

vim.api.nvim_set_keymap('n', '<leader>qq', '<cmd>lua toggle_qf()<CR>', opt)

-- }}}

require 'auto_complete'

-- set last
vim.opt.exrc   = true
vim.opt.secure = true
