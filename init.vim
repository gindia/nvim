"
"

"set completeopt=menu,menuone,noselect
"set omnifunc=syntaxcomplete#Complete

lua << EOF
require 'gindia'
EOF

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"use C not C++ for .h
"let c_syntax_for_h=1

nnoremap <silent><F12> <cmd>Make build<cr>
nnoremap <silent><F5>  <cmd>Make run<cr>

autocmd Filetype c,cpp nnoremap <silent><leader>h  <cmd>ClangdSwitchSourceHeader<cr>
autocmd Filetype c,cpp set sw=2

autocmd FileType rust,toml :compiler cargo

set exrc
set secure
