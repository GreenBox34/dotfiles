set nocompatible

call plug#begin()
  Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on	
syntax on

set relativenumber
set colorcolumn=100

set shiftwidth=2
set tabstop=2
set expandtab

let g:gruvbox_contrast_dark='hard'
set t_Co=256
set background=dark
colorscheme gruvbox

