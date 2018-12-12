" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

Plugin 'junegunn/vim-easy-align'

Plugin 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
  let g:ycm_semantic_triggers = {
    \ 'c' : ['->', '.', '&', 're![_a-zA-Z]'],
    \ 'cpp' : ['.', '->', '::', '&', 're![_a-zA-Z]'],
    \ }
  let g:ycm_log_level = 'error'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/nerdtree'
  map <F4> :NERDTreeToggle<CR>

Plugin 'mattn/emmet-vim'
  let g:user_emmet_mode='a'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
  let g:user_emmet_leader_key=','

"Plugin 'artur-shaik/vim-javacomplete2'
"  autocmd FileType java setlocal omnifunc=javacomplete#Complete

"Plugin 'vim-latex/vim-latex'
"  let g:tex_flavor='latex'
"  set iskeyword+=:
"  autocmd FileType tex,latex setlocal sw=2
