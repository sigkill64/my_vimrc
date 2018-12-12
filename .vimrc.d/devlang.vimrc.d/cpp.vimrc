setlocal cindent

" keymap
let mapleader=','
inoremap <Leader>m int main()<CR>{<CR><CR><CR>return 0;<CR>}<Up><Up><Up><Tab>
inoremap <Leader>M int main(int argc, char *const *argv)<CR>{<CR><CR><CR>return 0;<CR>}<Up><Up><Up><Tab>

inoremap <Leader>i #include <><LEFT>
inoremap <Leader>I #include ""<LEFT>
