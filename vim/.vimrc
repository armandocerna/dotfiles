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
colorscheme solarized
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab
set number
map <silent> <C-n> :NERDTreeFocus<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" swap files (.swp) in a common location
" " // means use the file's full path
set dir=~/.vim/swap/
"
" " backup files (~) in a common location if possible
set backup
set backupdir=~/.vimbackup/,~/tmp,.

" " turn on undo files, put them in a common location
set undofile
set undodir=~/.vimundo/
