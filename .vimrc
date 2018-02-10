call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'rstacruz/vim-closer'

Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors
set t_Co=256

" Use a color scheme
colorscheme gruvbox
set background=dark

" Airline 
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Use Vim settings, rather than Vi settings
set nocompatible

" Enable use of the mouse
set mouse=a

" Highlight cursor line
set cursorline

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Show line numbers
set number

" Highlight column 90
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray

set incsearch
set hlsearch

set laststatus=2
set ruler
set wildmenu

set display+=lastline

" Indentation
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
