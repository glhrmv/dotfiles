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

" Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

" deoplete (autocomplete)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" File explorer
Plug 'scrooloose/nerdtree'

" ALE (Asynchronous Linting Engine)
Plug 'w0rp/ale'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Status line
 Plug 'itchyny/lightline.vim'

" Version control
" Git
Plug 'tpope/vim-fugitive'
" Show diffs
Plug 'mhinz/vim-signify'

" Tag explorer (:TagBar to see tags for current file)
Plug 'majutsushi/tagbar'

" Commentary (gcc to toggle comment on line, gc on visual selection)
Plug 'tpope/vim-commentary'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Languages-related plugins
" Ctags
Plug 'ludovicchabant/vim-gutentags'
" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mmorearty/elixir-ctags'
" Emmet (HTML)
Plug 'mattn/emmet-vim'
" CSS
Plug 'ap/vim-css-color'
" Vue
Plug 'posva/vim-vue'

" Utilities
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/a.vim'
Plug 'qpkorr/vim-renamer'

" Colours
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'rakr/vim-one'

call plug#end()

" }}}

" *******
" Plugin settings
" *******
" {{{

" *******
" deoplete
" *******
" Enable deoplete
let g:deoplete#enable_at_startup = 1

" *******
" NERDTree
" *******
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" *******
" ALE
" *******
" Configure ALE fixers
let b:ale_fixers = {
      \'javascript':
      \['prettier', 'eslint']
      \}

" Ignore config warning if no eslintrc file present
let g:ale_javascript_eslint_suppress_missing_config = 1

" *******
" CtrlP
" *******
" Search tags
let g:ctrlp_extensions = ['tag']
" Ignore certain files & folders
let g:ctrlp_custom_ignore = 'node_modules\|deps\|_build\|DS_Store\|git$'

" *******
" lightline
" *******
let g:lightline = {}
let g:lightline.colorscheme = 'hybrid'

" *******
" signify
" *******
let g:signify_vcs_list = [ 'git', 'svn' ]

" *******
" emmet
" *******
" Trigger emmet with <Leader>,
let g:user_emmet_leader_key=','
" Define which file types to use emmet with
autocmd FileType html,css,jsx,scss,sass,eex EmmetInstall

" }}}

" *******
" Language servers registry
" *******
" {{{

" }}}

" *******
" Colours
" *******
" {{{

set background=dark
colorscheme hybrid

" }}}

" vim: set foldmethod=marker:
