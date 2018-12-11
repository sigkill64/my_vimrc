" ----------------
" Normal Setting
" ----------------
syntax on
 
set t_Co=256
colorscheme desert

set number
" set relativenumber
set nocompatible              " Will Be Set in Vundle Plugin Setting
set incsearch
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
"set foldmethod=indent

" ---------------
" Include Profiles in .vimrc.d/
" ---------------
for $profile in split(globpath('~/.vimrc.d', '*.vimrc'), '\n')
    source $profile
endfor
