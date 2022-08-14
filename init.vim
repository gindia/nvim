"
"

"set completeopt=menu,menuone,noselect
"set omnifunc=syntaxcomplete#Complete

lua << EOF
require 'config'
EOF

set laststatus=3

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"use C not C++ for .h
"let c_syntax_for_h=1
autocmd Filetype sh,c,cpp nnoremap <silent><F12> <cmd>silent make build\|redraw!<cr>
autocmd Filetype sh,c,cpp nnoremap <silent><F10> <cmd>silent make tests\|redraw!<cr>
autocmd Filetype sh,c,cpp nnoremap <silent><F9>  <cmd>silent make run\|redraw!<cr>
autocmd Filetype c,cpp nnoremap <silent><leader>h  <cmd>ClangdSwitchSourceHeader<cr>
autocmd FileType c,cpp noremap  <silent>gt <C-]>

autocmd FileType rust,toml :compiler cargo
autocmd Filetype rust,toml nnoremap <silent><F12> <cmd>silent make build\|redraw!<cr>
autocmd Filetype rust,toml nnoremap <silent><F10> <cmd>silent make test\|redraw!<cr>
autocmd Filetype rust,toml nnoremap <silent><F9>  <cmd>silent make run\|redraw!<cr>
