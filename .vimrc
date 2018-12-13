"  --------------------- "
"       Plugin list
"  --------------------- "
" Auto install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" --- Vundle, plugin Manager --- "
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'        " Git on Vim with :Gstatus...
Plug 'tpope/vim-surround'        " Parentheses, brackets, quotes...
Plug 'tpope/vim-commentary'      " Comment file with gcc
Plug 'mhinz/vim-signify'         " Add +/- in the sign bar with gitdif TODO need?
Plug 'SirVer/ultisnips'          " Snippet completion TODO ever used?
Plug 'honza/vim-snippets'        " Dependency of ultisnips TODO ever used?
Plug 'junegunn/vim-easy-align'   " to align group of variable
" Plug 'w0rp/ale'                  " Syntax check TODO needed?
call plug#end()

"  --------------------- "
"       Plugin option
"  --------------------- "
" Git Signify plugin
highlight SignColumn         ctermbg=black
highlight SignifySignAdd     ctermfg=green
highlight SignifySignDelete  ctermfg=red
highlight SignifySignChange  ctermfg=blue

" Ultisnips plugin 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Easy align to use with gaip or vga
nmap ga <Plug>(EasyAlign) 
xmap ga <Plug>(EasyAlign)

"  --------------------- "
"     General option
"  --------------------- "
" --- Leader --- "
let mapleader=','
let maplocalleader=','

set ignorecase
set complete-=i     "to accelerate tab completion

"--- Buffer explorer ---
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

"--- Indent ---
set autoindent
set smartindent          "Auto indent
set cindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set fileformats=unix
set nofoldenable            " ... but have folds open by default

"--- Search ---
set incsearch
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set smartcase

" Tags directory
set tags=tags;/

" Colours
set t_Co=256
hi Comment ctermfg=blue
hi Search ctermbg=blue ctermfg=white
if &diff
    colorscheme desert
endif

"--- Dimension, wrap ---
set wrap
set nolist  
set wrapmargin=0
set textwidth=80
set formatoptions+=t 
set linebreak "(optional - breaks by word rather than character)

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Quickfix
nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
nnoremap <leader>q :ccl<CR>  

"Open quickfix window by default"
augroup QuickFixAutoload
    autocmd QuickFixCmdPost [^l]* nested botright cwindow
    autocmd QuickFixCmdPost    l* nested botright lwindow
augroup END

"Search - get ride of Ctrlp
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>

" Buffer list
" 1st solution
set wildcharm=<C-z>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>
" 2nd solution
"nnoremap gb :ls<CR>:b
nnoremap <C-b> <esc>:ls<CR>:b
"map <C-b> <esc>:CtrlPBuffer<CR>
" 3rd solution
"nnoremap gb :CtrlPBuffer<CR>

" Vimgrep
set grepprg=git\ grep\ -n
nnoremap <leader>g :silent grep! <cword><CR>
" same function - not sure which one if the fastest
" noremap <leader>g :execute "vimgrep /" . expand('<cword>') ."/gj ". " `git ls-files`"<CR><bar> 
" nnoremap <leader>G :silent Ggrep! <cword><CR>

" Tag 
nnoremap <leader>j :tjump /

" Compilation with :make, get ride of Ale plugin
nnoremap <leader>m :make<cr>
" au BufEnter *.c compiler gcc
" autocmd Filetype c setlocal makeprg=gcc\ -o\ %<\ %
" autocmd Filetype cpp setlocal makeprg=g++\ -o\ %<\ %
" autocmd Filetype python setlocal makeprg=python\ %

" Netrw settings
let g:netrw_banner = 0  
nnoremap - :Explore<CR>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
