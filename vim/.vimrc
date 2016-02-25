set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'unblevable/quick-scope'
Plugin 'pearofducks/ansible-vim'
"Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()      

filetype plugin on
syntax on
set background=dark
set t_Co=256
colo CandyPaper


filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab
set number
map <silent> <C-n> :NERDTreeFocus<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:airline#extensions#tabline#enabled = 1

" Vim temp files outside of working directories
set dir=~/.tmp/swap/
set backup
set backupdir=~/.tmp/backup/
set undofile
set undodir=~/.tmp/undo/

" Quickscope
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
  execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

" Easier split navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
