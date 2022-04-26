" set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set smartindent
set backspace=2

set hlsearch
noremap <SPACE><CR> :nohlsearch<CR>
noremap nn :set nonumber<CR>
noremap n :set number<CR>

set incsearch
set ignorecase
set smartcase

" 方位键 大写表示页内跳转
noremap i k
noremap I 5k

noremap k j
noremap K 5j

noremap j h
" 行内快速跳转
noremap J B
noremap L E
noremap j b
noremap l e

" 空格表示页面边界跳转
" 行首或者行尾
noremap <SPACE>i gg
noremap <SPACE>k G
" 跳转到页面的行首和行尾 
noremap <SPACE>j H
noremap <SPACE>l L

" 插入
noremap h i
noremap H I

" 保存退出
map S :w<CR>
map Q :q<CR>
map s <nop>

" tab = 4 space
set ts=4
set sw=4

"上下左右分屏 vsplit split
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

"" vim-plugin插件管理工具
"call plug#begin('~/.vim/plugged')
"
"Plug 'vim-airline/vim-airline'
"" Plug 'connorholyday/vim-snazzy'
"
"call plug#end()
"
"" let g:SnazzyTransparent = 1
"" colorscheme snazzy
