" -------------------------
" Basic Settings
" -------------------------
set nocompatible
set noesckeys
set wrap
set encoding=UTF-8
set clipboard=unnamed,unnamedplus
set mouse=a
set modifiable
set noswapfile
set backspace=indent,eol,start
set fillchars+=eob:\

" -------------------------
" UI Enhancements
" -------------------------
syntax enable
set number
set showmatch
set hlsearch
set incsearch
set smartcase

" -------------------------
" Indentation
" -------------------------
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent

" -------------------------
" Folding
" -------------------------
set foldmethod=indent
set foldmarker={,},(,)

" -------------------------
" Leader Key
" -------------------------
let mapleader = " "

" -------------------------
" Key Mappings
" -------------------------
" Clear search highlights
nnoremap <Esc> :noh<Return><Esc>
nnoremap <Esc>^[ <Esc>^[
" Prettier
nnoremap <leader>f :CocCommand prettier.formatFile<CR>

" Reload vimrc on save
au BufWritePost .vimrc so ~/.vimrc

" Tabs navigation
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>c :tabclose<CR>
nnoremap <Leader>z :tabprev<CR>
nnoremap <Leader>x :tabnext<CR>

" Toggle IndentLines
nnoremap <Leader>d :IndentLinesDisable<CR>
nnoremap <Leader>e :IndentLinesEnable<CR>

" Terminal mdcat preview
nnoremap <Leader>p :w<CR>:terminal mdcat %<CR>

" Folding keymaps
nnoremap <silent> zc :normal! zc<CR>
nnoremap <silent> zo :normal! zo<CR>
nnoremap <silent> zM :normal! zM<CR>
nnoremap <silent> zR :normal! zR<CR>

" Window navigation
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" NERDTree shortcuts
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-a> :NERDTreeClose<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Coc Autocomplete
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" -------------------------
" Plugin Settings
" -------------------------
let g:polyglot_disabled = ['markdown']

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0

" IndentLine
let g:indentLine_color_term = 2
let g:indentLine_char = '|'
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" NERDTree
let g:NERDTreeLimitedSyntax = 1

" -------------------------
" Plugins (vim-plug)
" -------------------------
call plug#begin()
  Plug 'preservim/NERDTree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'Yggdroot/indentLine'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/goyo.vim'
  Plug 'dylanaraps/wal.vim'
call plug#end()

" -------------------------
" Colorscheme
" -------------------------
colorscheme wal
