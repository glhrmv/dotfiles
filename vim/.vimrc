" *******
" Core settings (start)
" *******

if has('gui_running')
  " If we're on a graphical user interface,
  " Set a font at specific size
  set guifont=Hack:h12
  " Disable left and right scrollbars
  set guioptions=
else
  " If we're in the terminal,
  " Enable true colour support
  set term=screen-256color
endif

" Set leader key to ,
let mapleader=","

" Switch syntax highlighting on
syntax on

" Share system and vim clipboard
set clipboard=unnamed

" Show line numbers
set number

" Enable use of the mouse
set mouse=a
set ttymouse=xterm2

" Folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1

" Split pane navigation
" Using Ctrl + vim direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Highlight cursor line
set cursorline

" Automatically look for ctags
set autochdir
set tags=tags;

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Highlight column 90
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray

" Search incrementally, as opposed to only after pressing ENTER
set incsearch

" Highlight search pattern results
set hlsearch

" Each buffer always has a statusline
set laststatus=2

" Show the line and column number of the cursor position
set ruler

" Invoke autocompletion (with <Tab>) for command-line operations
set wildmenu

" Indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" If the file was deleted outside of Vim, read it again
set autoread

" Minimum number of screen lines to keep above and below the cursor
if !&scrolloff
  set scrolloff=1
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Remember up to 100 operations
if &history < 100
  set history=100
endif

" Use a viminfo file to store important information (see :h viminfo)
if !empty(&viminfo)
  set viminfo^=!
endif

set sessionoptions-=options

" *******
" Core settings (end)
" *******

" *******
" Plugins (start)
" *******

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

" General plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/a.vim'
Plug 'ervandew/supertab'
Plug 'qpkorr/vim-renamer'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'

" Language-specific plugins
" Plug 'elixir-editors/vim-elixir'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'ap/vim-css-color'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Plugin-specific settings

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-jsx
let g:jsx_ext_required = 0

" emmet-vim
" Use emmet only for html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,scss,sass,eex EmmetInstall

" vim-gitgutter
set updatetime=100

" *******
" Plugins (end)
" *******

" Use a color scheme
set background=dark
color jellybeans
