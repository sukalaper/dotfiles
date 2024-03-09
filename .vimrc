" Disable compatibility 
  set nocompatible

" Disable wrap text
  set wrap

" Copy paste
  set clipboard=unnamed,unnamedplus

" Show syntax
  syntax enable

" Show number line
  set number

" Search highlighting
  set incsearch
  set hlsearch

" Highlight code pair
  set showmatch
  
" Tab settings to 2 space
  set expandtab
  set tabstop=2
  set shiftwidth=2

" Folding methode
  set foldmethod=indent
  set foldmarker={,}

" Enable indent
  set smartindent
  set autoindent

" Encoding UTF-8
  set encoding=UTF-8

" Set leader
  let mapleader = " "

" Remove ~ ending file
  set fillchars+=eob:\ 

" Fast to delete
  set backspace=indent,eol,start

" Disable swap file
  set noswapfile

" Ignore case in search
  set smartcase

" Enable mouse mode 
  set mouse=a

" Modifiable
  set modifiable

" Auto formatting (COC)
  command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Apply change without re-open vim
  au BufWritePost .vimrc so ~/.vimrc

" Disable polyglot for markdown
  let g:polyglot_disabled = ['markdown']

" Plugin
  call plug#begin()
    Plug 'sainnhe/sonokai' 
    Plug 'preservim/NERDTree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/goyo.vim'
    Plug 'dylanaraps/wal.vim'
    Plug 'sukalaper/koreksi-bahasa-inggris-pada-markdown-dengan-vim'
  call plug#end()

" Airline extension
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_highlighting_cache = 1
  let airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_tab_type = 0

" Tab control and navigation
  nnoremap <Leader>t :tabnew<CR>
  nnoremap <Leader>c :tabclose<CR>
  nnoremap <Leader>z :tabprev<CR>
  nnoremap <Leader>x :tabnext<CR>

" Show and hide indentline
  nnoremap <Leader>d :IndentLinesDisable<CR>
  nnoremap <Leader>e :IndentLinesEnable<CR>

" Indenline settings
  let g:indentLine_color_term = 2
  let g:indentLine_char = '|'
  let g:indentLine_defaultGroup = 'SpecialKey'
  let g:indentLine_concealcursor = 'inc'
  let g:indentLine_conceallevel = 2

" Folding control
  nnoremap <silent> zc :normal! zc<CR>
  nnoremap <silent> zo :normal! zo<CR>
  nnoremap <silent> zM :normal! zM<CR>
  nnoremap <silent> zR :normal! zR<CR>

" Mapping to format selected code using COC
  vmap <leader>f <Plug>(coc-format-selected)
  nmap <leader>f <Plug>(coc-format-selected)

" Fix TAB in autocomplete
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mapping NERDTree
  nnoremap <leader>n :NERDTreeFocus<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-a> :NERDTreeClose<CR>
  nnoremap <C-f> :NERDTreeFind<CR>

" Mapping for control focus window
  nnoremap <silent> <c-k> :wincmd k<CR>
  nnoremap <silent> <c-j> :wincmd j<CR>
  nnoremap <silent> <c-h> :wincmd h<CR>
  nnoremap <silent> <c-l> :wincmd l<CR>

" Color definition 
  colorscheme wal

" Call dictionary
  source ~/.vim/plugged/koreksi-bahasa-inggris-pada-markdown-dengan-vim/konfigurasi-kamus.vim
