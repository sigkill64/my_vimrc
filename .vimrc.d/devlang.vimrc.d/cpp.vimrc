setlocal cindent

" keymap
inoremap `m int main()<CR>{<CR><CR><CR>return 0;<CR>}<Up><Up><Up><Tab>
inoremap `M int main(int argc, char *const *argv)<CR>{<CR><CR><CR>return 0;<CR>}<Up><Up><Up><Tab>

inoremap `i #include <><LEFT>
inoremap `I #include ""<LEFT>

inoremap `fn ()<CR>{<CR>}<UP><UP><HOME>
inoremap `fv void ()<CR>{<CR>}<UP><UP><END><LEFT><LEFT>
inoremap `fi int ()<CR>{<CR>}<UP><UP><END><LEFT><LEFT>
