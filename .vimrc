" Auto install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'        " Git on Vim with :Gstatus... what to I use? Gw, Ggrep
Plug 'tpope/vim-commentary'      " Comment file with gcc
call plug#end()

set ignorecase
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
hi Comment ctermfg=blue
hi Search ctermbg=blue ctermfg=white
autocmd QuickFixCmdPost *grep* cwindow
