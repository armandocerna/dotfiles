set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'unblevable/quick-scope'
Plug 'pearofducks/ansible-vim'
call plug#end()

filetype plugin on
syntax on
set background=dark
set t_Co=256
colo CandyPaper

filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab
set relativenumber
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

" use jj to exit insert mode
imap jj <Esc>
"
" GRAVEYARD
"
"
"
"
" Easier split navigation nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" inoremap <C-J> <C-W><C-J>
" inoremap <C-K> <C-W><C-K>
" inoremap <C-L> <C-W><C-L>
" inoremap <C-H> <C-W><C-H>
"
" Align blocks of text and keep them selected
" vmap < <gv
" vmap > >gsv
