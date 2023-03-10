"
"

"set completeopt=menu,menuone,noselect
"set omnifunc=syntaxcomplete#Complete

lua << EOF
require 'gindia'
require 'sea'
EOF

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

set list
set lcs+=space:^

"use C not C++ for .h
"let c_syntax_for_h=1

nnoremap <silent><F12> <cmd>Make build<cr>
nnoremap <silent><F5>  <cmd>Make run<cr>
nnoremap <silent><F4>  <cmd>lua floating_make_run()<cr>

autocmd Filetype c,cpp nnoremap <silent><leader>h  <cmd>ClangdSwitchSourceHeader<cr>
autocmd Filetype c,cpp set sw=2

autocmd FileType rust,toml :compiler cargo
autocmd FileType dosbatch,c,cpp,h,hpp :compiler win_batch


set exrc
set secure
