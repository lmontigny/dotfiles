" Auto install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'        " Git on Vim with :Gstatus... what do we use? Gdiff, Ggrep
Plug 'tpope/vim-commentary'      " Comment file with gcc
call plug#end()

" Option
set ignorecase
set complete-=i
set encoding=utf-8
set list listchars=tab:»·,trail:$
set path=.,**
set tags=tags;/
set incsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set wildmenu
set textwidth=80
set t_Co=256

" Colours
hi Comment ctermfg=blue
hi Search ctermbg=blue ctermfg=white
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88

" Remap
nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
nnoremap <C-b> <esc>:ls<CR>:b
nnoremap gp :silent Ggrep! <cword><CR>
nnoremap - :Explore<CR>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

autocmd QuickFixCmdPost *grep* cwindow
