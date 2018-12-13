" *******
" Core
" *******
" {{{

" Enable true colours
set termguicolors

" Set leader key to <,>
let mapleader=","

" 2 space indentation
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Share system and vim clipboard
set clipboard+=unnamedplus

" Show line numbers
set number

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
set colorcolumn=90
highlight ColorColumn ctermbg=darkgray

" Minimum number of screen lines to keep above and below the cursor
if !&scrolloff
  set scrolloff=1
endif

" For conceal markers
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

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
" Key mappings
" *******
" {{{

" <Leader-f> Fix indentation in file
map <leader>f mmgg=G`m<CR>

" <Esc> Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" <Esc> Clear search highlight in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" <Ctrl-direction> Split pane navigation using
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}

" *******
" Plugins
" *******
" {{{

" Install plugins with :PlugInstall

call plug#begin('~/.local/share/nvim/plugged')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" ale
Plug 'w0rp/ale'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree file explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Gutentags
Plug 'ludovicchabant/vim-gutentags'

" Tag explorer
Plug 'majutsushi/tagbar'

" Commentary
Plug 'tpope/vim-commentary'

" Goyo
Plug 'junegunn/goyo.vim'

" Utilities
Plug 'editorconfig/editorconfig-vim'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/a.vim'
Plug 'qpkorr/vim-renamer'

" Language-related plugins
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier'

" Colour schemes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Alduin'
Plug 'danilo-augusto/vim-afterglow'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'reedes/vim-colors-pencil'
Plug 'ayu-theme/ayu-vim'

call plug#end()

" }}}

" *******
" Plugin-specific settings
" *******
" {{{

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" neosnippet key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" ALE
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}

" ctrlp
" Use ctrlp for searching tags
let g:ctrlp_extensions = ['tag']
" Ignore certain files & folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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

" }}}

" *******
" Colours
" *******
" {{{

set background=dark
let g:airline_theme='alduin'
colorscheme alduin

" }}}

" vim: set foldmethod=marker:
