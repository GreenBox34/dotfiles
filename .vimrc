set nocompatible

call plug#begin()
  Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on	
syntax on

set viminfo+=n~/.vim/viminfo

set relativenumber
set colorcolumn=100

set shiftwidth=2
set tabstop=2
set expandtab

let g:gruvbox_contrast_dark='hard'
set t_Co=256
set background=dark
colorscheme gruvbox

nmap ex :Ex<CR>

nmap bn :bnext<CR>
nmap bp :bprevious<CR>
nmap bd :bdelete<CR>
nmap bl :buffers<CR>

