call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" Airline 
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Use a color scheme
colorscheme gruvbox
set background=dark

" Use Vim settings, rather than Vi settings
set nocompatible

set mouse=a

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Show line numbers
set number

set incsearch
set hlsearch

set laststatus=2
set ruler
set wildmenu

set display+=lastline

" 2 space indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

set autoread

if !&scrolloff
  set scrolloff=1
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if &history < 100
  set history=100
endif

if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options
