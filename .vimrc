"Regular set
"----------------------------------------------------
"clear search highlight.
noh
"enable syntax color.
syntax on
"enable number
set number
set rnu
"always show what mode we're currently editing in
set showmode
"set show matching parenthesis
set showmatch
"show (partial) command in the last line of the screen
set showcmd
"a tab is one spaces
set tabstop=2
"one of spaces per tab when editing
set softtabstop=2
"spaces to insert or remove using the indentation commands
set shiftwidth=4
"tabs are spaces
set expandtab
"use a status bar that is 1 rows high
set cmdheight=1
"tell VIM to always put a status line even if there is only one windown
set laststatus=2
"environment variable to indicate that UTF-8 is your preferred character encoding
set encoding=UTF-8
"set leader VIM
let mapleader = " "
"delete ~ character 
set fillchars=eob:\ 
"delete file nerd tree\ 
set modifiable
set ma
"fast delete previous word
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
"---------------------------------------------------


"Plugins VIM
"---------------------------------------------------
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'dylanaraps/wal.vim'
call plug#end()
"----------------------------------------------------


"Colorscheme
"----------------------------------------------------
hi Normal guibg=black ctermbg=black
 " Important!!
        if has('termguicolors')
          set termguicolors
        endif
        " The configuration options should be placed before `colorscheme sonokai`.
        let g:sonokai_style = 'default'
        let g:sonokai_better_performance = 1
        colorscheme sonokai
"----------------------------------------------------


"IndentLine
"----------------------------------------------------
"set color indentline
let g:indentLine_color_term = 239
"display character lines
let g:indentLine_char = '|'
"let g:indentLine_char = ' '
"to use the same colors that are used for tab indents
let g:indentLine_defaultGroup = 'SpecialKey'
"-----------------------------------------------------


"Vim Devicons
"----------------------------------------------------
"for fix ^[P1$r0 q^[\^[[?12;4$y
set t_RV=
set background=dark
"-----------------------------------------------------


"Airline
"----------------------------------------------------
"which will automatically populate the g:airline_symbols dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1
"an empty array would effectively disable all extensions
let g:airline_extensions = []
"will however clear the cache
let g:airline_highlighting_cache = 1
"enable by default
let g:airline#extensions#tabline#enabled = 1
"theme selections
let g:airline_theme='sonokai'
"-----------------------------------------------------


"NerdTree 
"-----------------------------------------------------
"focus nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
"show nerdtree 
nnoremap <C-n> :NERDTree<CR>
"close nerdtree
nnoremap <C-a> :NERDTreeClose<CR>
"find in nerdtree
nnoremap <C-f> :NERDTreeFind<CR>
"change focus to up 
nmap <silent> <c-k> :wincmd k<CR>
"change focus to down
nmap <silent> <c-j> :wincmd j<CR>
"change focus to left
nmap <silent> <c-h> :wincmd h<CR>
"change focus to right
nmap <silent> <c-l> :wincmd l<CR>
"-----------------------------------------------------


"Css Color
"-----------------------------------------------------
"for show color code
let g:cssColorVimDoNotMessMyUpdatetime = 1
"-----------------------------------------------------


"Fzf Setup with Ctrl
"-----------------------------------------------------
let $FZF_DEFAULT_OPTS ="--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-f:preview-down,ctrl-b:preview-up --preview 'bat --style=numbers  --color=always --line-range=:500 {}'"
let g:fzf_action = {
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\ }
"find file in directory
silent! nmap <C-p> :Files<CR>
"find file repo git
silent! nma <C-g> :Gfiles<CR>
"find file string/regex
silent! nmap <C-f> :Rg!
"-----------------------------------------------------


"OmniFunc Autocomplete
"-----------------------------------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"highlight Pmenu ctermbg=214 gui=bold
"-----------------------------------------------------


"Coc Autocomplete C++
"--------------------------------
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
set signcolumn=number
else
set signcolumn=yes
endif
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
function! CheckBackSpace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'  
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
