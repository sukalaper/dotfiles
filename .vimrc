set nocompatible

set wrap

set clipboard=unnamed,unnamedplus  

syntax enable

set number

set incsearch  
set hlsearch
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set showmatch

set expandtab      
set tabstop=2      
set shiftwidth=2    

set foldmethod=indent  
set foldmarker={,},(,)     

set smartindent  
set autoindent   

set encoding=UTF-8

let mapleader = " "  

set fillchars+=eob:\  

set backspace=indent,eol,start  

set noswapfile

set smartcase  

set mouse=a

set modifiable

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument  

au BufWritePost .vimrc so ~/.vimrc

let g:polyglot_disabled = ['markdown']

call plug#begin()  
  Plug 'preservim/NERDTree'  
  Plug 'vim-airline/vim-airline'  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}  
  Plug 'vim-airline/vim-airline-themes' 
  Plug 'ryanoasis/vim-devicons' 
  Plug 'Yggdroot/indentLine'  
  Plug 'sheerun/vim-polyglot' 
  Plug 'junegunn/goyo.vim'  
  Plug 'dylanaraps/wal.vim'  
call plug#end()  

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
call neobundle#end()
NeoBundleCheck

let g:airline#extensions#tabline#enabled = 1  
let g:airline_powerline_fonts = 1  
let g:airline_highlighting_cache = 1  
let airline#extensions#tabline#show_buffers = 0  
let g:airline#extensions#tabline#show_splits = 0  
let g:airline#extensions#tabline#show_tab_type = 0  

nnoremap <Leader>t :tabnew<CR>  
nnoremap <Leader>c :tabclose<CR>  
nnoremap <Leader>z :tabprev<CR>  
nnoremap <Leader>x :tabnext<CR>  

nnoremap <Leader>d :IndentLinesDisable<CR>  
nnoremap <Leader>e :IndentLinesEnable<CR>   

let g:indentLine_color_term = 2  
let g:indentLine_char = '|'  
let g:indentLine_defaultGroup = 'SpecialKey'  
let g:indentLine_concealcursor = 'inc'  
let g:indentLine_conceallevel = 2  

nnoremap <silent> zc :normal! zc<CR>  
nnoremap <silent> zo :normal! zo<CR>  
nnoremap <silent> zM :normal! zM<CR>  
nnoremap <silent> zR :normal! zR<CR>  

vmap <leader>f <Plug>(coc-format-selected)  
nmap <leader>f <Plug>(coc-format-selected)  

nnoremap <leader>n :NERDTreeFocus<CR>  
nnoremap <C-n> :NERDTree<CR>  
nnoremap <C-a> :NERDTreeClose<CR>  
nnoremap <C-f> :NERDTreeFind<CR>  
let g:NERDTreeLimitedSyntax = 1

nnoremap <silent> <c-k> :wincmd k<CR>  
nnoremap <silent> <c-j> :wincmd j<CR>  
nnoremap <silent> <c-h> :wincmd h<CR>  
nnoremap <silent> <c-l> :wincmd l<CR>  

colorscheme wal

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"  
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 
