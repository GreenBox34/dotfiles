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

" functions

let g:enable_whitespace = 0
function! Toggle_whitespace()
  if g:enable_whitespace == 0
    let g:enable_whitespace = 1
  else
    let g:enable_whitespace = 0
  endif
  if g:enable_whitespace == 0
    set nolist
  endif
  if g:enable_whitespace == 1
    set list
    set listchars+=space:.
  endif
endfunction

call Toggle_whitespace()

" mappings

nmap wt :call Toggle_whitespace()<CR>

nmap ex :Ex<CR>

nmap bn :bnext<CR>
nmap bp :bprevious<CR>
nmap bd :bdelete<CR>
nmap bl :buffers<CR>

