
set belloff=all 
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guifont=:h19
set clipboard=unnamed

set nobackup
set noswapfile

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set softtabstop=4
set backspace=indent,eol,start
set smartindent
set termguicolors
set nowrap

set mouse=a

colorscheme PaperColor
syntax on

" KeyBinds
let mapleader = "\<Space>"

nnoremap <Leader>tt :term<cr>

nnoremap <Leader>cc :set colorcolumn=80<cr>
nnoremap <Leader>ncc :set colorcolumn-=80<cr>
nnoremap <Leader>spr :vsp<cr>
nnoremap <Leader>spd :split<cr>
