" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" Plugins (start)
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'rstacruz/vim-closer'
Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Language-specific plugins
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()
" Plugins (end)

" Plugin-specific settings (start)

" Airline 
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-jsx
let g:jsx_ext_required = 0

" Plugin-specific settings (end)

" Other settings (start) 

" Enable true colour support
set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors
set t_Co=256

" Use a color scheme
colorscheme gruvbox
" set background=dark

" Enable use of the mouse
set mouse=a
set ttymouse=xterm2

" Folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1

" Split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
" Other settings (end)
