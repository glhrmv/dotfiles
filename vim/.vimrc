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
  set term=xterm-256color
  set termguicolors

  set t_8b=[48;2;%lu;%lu;%lum
  set t_8f=[38;2;%lu;%lu;%lum
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

" Set encoding
set encoding=UTF-8

" Folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1

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
" Remappings (start)
" *******

" Split pane navigation
" Using Ctrl + vim direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Single line bubbling
nmap <C-Up> [e
nmap <C-Down> ]e

" Multiple line bubbling
vmap <C-Up> [egv
vmap <C-Down> ]egv

" *******
" Remappings (end)
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

" General plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/a.vim'
Plug 'qpkorr/vim-renamer'
Plug 'editorconfig/editorconfig-vim'

" Language-related plugins
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components'
Plug 'prettier/vim-prettier'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" Plugin-specific settings

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" ctrlp
" Use ctrlp for searching tags
let g:ctrlp_extensions = ['tag']
" Ignore certain files & folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ALE
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" vim-gitgutter
" Automatically update every 300ms
set updatetime=300

" vim-jsx
" Use vim-jsx on regular .js files
let g:jsx_ext_required = 0

" emmet-vim
" Use Emmet only for html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,scss,sass,eex EmmetInstall
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" *******
" Plugins (end)
" *******

" Use a color scheme
set background=dark
colorscheme jellybeans
