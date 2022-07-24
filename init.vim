"
"

"use C not C++ for header files
let c_syntax_for_h=1

set completeopt=menu,menuone,noselect
set omnifunc=syntaxcomplete#Complete

lua << EOF
require 'config'
EOF

nnoremap <silent><F12> <cmd>silent make\|redraw!<cr>
nnoremap <silent><F9>  <cmd>silent make run\|redraw!<cr>

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

noremap <silent>gd <C-]>

set laststatus=3
