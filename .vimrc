" VIM Configuration File
set nocompatible
set viminfo+=n~/.vim/viminfo

call plug#begin()
  Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on
syntax on

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set number
set textwidth=120
set colorcolumn=120
set cursorline
set nowrap

set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab

set t_Co=256
syntax enable
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=1
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

nmap bn :bnext!<CR>
nmap bp :bprevious!<CR>
nmap bd :bdelete<CR>
nmap bl :buffers<CR>

" vim: et sw=2 ts=2
