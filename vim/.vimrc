set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'

call vundle#end()      

filetype plugin on
syntax on
set background=dark
"colorscheme solarized
set t_Co=256
colo CandyPaper

filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab
set number
map <silent> <C-n> :NERDTreeFocus<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" swap files (.swp) in a common location
" " // means use the file's full path
set dir=~/.tmp/swap/
"
" " backup files (~) in a common location if possible
set backup
set backupdir=~/.tmp/backup/

" " turn on undo files, put them in a common location
set undofile
set undodir=~/.tmp/undo/
