" *******
" Core
" *******
" {{{ 

" Set leader key to <,>
let mapleader=","

" Enable true colours
set termguicolors

" 2 space indentation
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Show line numbers
set number

" Share system and vim clipboard
set clipboard+=unnamedplus

" Enable use of the mouse
set mouse=a

" Automatically update cwd
set autochdir

" Folding
set foldmethod=syntax
set foldlevel=99
set foldnestmax=1

" Automatically set screen title
set title

" Required for operations modifying multiple buffers like rename.
set hidden

" Highlight cursor line
set cursorline

" Highlight column 90
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

" Minimum number of screen lines to keep above and below the cursor
if !&scrolloff
  set scrolloff=1
endif

" }}}

" *******
" Functions
" *******
" {{{

" Command to trim trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

" }}}

" *******
" Key remappings
" *******
" {{{

" <Leader><i> Fix indentation in file
map <leader>i mmgg=G`m<CR>

" <Esc> Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" <Esc> Clear search highlight in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" <Ctrl+direction> Split pane navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" }}}

" *******
" Plugins
" *******
" {{{

" vim-plug -- https://github.com/junegunn/vim-plug
" Install plugins with :PlugInstall

call plug#begin('~/.local/share/nvim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Signify (Version control)
Plug 'mhinz/vim-signify'

" Commentary 
" gcc to toggle comment on line,
" gc on visual selection)
Plug 'tpope/vim-commentary'

" Polyglot
Plug 'sheerun/vim-polyglot'
" Emmet (HTML)
Plug 'mattn/emmet-vim'
" CSS
Plug 'ap/vim-css-color'

" Utilities
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/a.vim'
Plug 'qpkorr/vim-renamer'

" Colours
Plug 'morhetz/gruvbox'

call plug#end()

" }}}

" *******
" Plugin settings
" *******
" {{{

" *******
" NERDTree
" *******
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" *******
" CtrlP
" *******
" Ignore certain files & folders
let g:ctrlp_custom_ignore = 'node_modules\|deps\|_build\|DS_Store\|git$'

" *******
" vim-signify
" *******
set updatetime=300

" *******
" emmet
" *******
" Trigger emmet with <Leader>,
let g:user_emmet_leader_key=','
" Define which file types to use emmet with
autocmd FileType html,css,jsx,scss,sass,eex EmmetInstall

" }}}

" *******
" Colours
" *******
" {{{

set background=dark
colorscheme gruvbox

" }}}

" vim: set foldmethod=marker:
