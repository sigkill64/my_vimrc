"
" Map Leader
let mapleader=','

"
" map for Normal Visual OperatorPending

"
" nmap for Normal
nnoremap <C-Tab> <C-w>w
nnoremap <C-b> /[)\]}]<CR>
nnoremap <Tab> <ESC>>>
nnoremap <S-Tab> <ESC><<

nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l

"
" vmap for Visual

"
" omap for OperatorPending

"
" map! for InsertOnly CommandLine

"
" imap for InsertOnly
inoremap <C-k> <Left>
inoremap <C-l> <Right>

inoremap <Up> <ESC><C-w>k
inoremap <Down> <ESC><C-w>j
inoremap <Left> <ESC><C-w>h
inoremap <Right> <ESC><C-w>l

inoremap <C-d> <C-k>

inoremap <C-b> <ESC>/[)\]}]<CR>a

inoremap <Leader>o <ESC><Up>o
inoremap <Leader>s <ESC>:w<CR>a

inoremap <Leader><Tab> <ESC>>>i
inoremap <Leader><S-Tab> <C-d>

func ReLeftParenthesis()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "()\<Left>"
    endif
    return "("
endfunc
inoremap ( <C-R>=ReLeftParenthesis()<CR>

func ReRightParenthesis()
    if getline('.')[col('.') - 1] == ')'
        return "\<Right>"
    endif
    return ")"
endfunc
inoremap ) <C-R>=ReRightParenthesis()<CR>

func ReLeftBrace()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "{}\<Left>"
    endif
    return "{"
endfunc
inoremap { <C-R>=ReLeftBrace()<CR>

func ReRightBrace()
    if getline('.')[col('.') - 1] == '}'
        return "\<Right>"
    endif
    return "}"
endfunc
inoremap } <C-R>=ReRightBrace()<CR>

func ReLeftSquareBracket()
    if getline('.')[col('.') - 1] == "\0" ||
                \ getline('.')[col('.') - 1] == " "
        return "[]\<Left>"
    endif
    return "["
endfunc
inoremap [ <C-R>=ReLeftSquareBracket()<CR>

func ReRightSquareBracket()
    if getline('.')[col('.') - 1] == ']'
        return "\<Right>"
    endif
    return "]"
endfunc
inoremap ] <C-R>=ReRightSquareBracket()<CR>

func ReSingleQuotaionMark()
    if getline('.')[col('.') - 1] == "'"
        return "\<Right>"
    endif
    return "''\<Left>"
endfunc
inoremap ' <C-R>=ReSingleQuotaionMark()<CR>

func ReDoubleQuotaionMark()
    if getline('.')[col('.') - 1] == '"'
        return "\<Right>"
    endif
    return '""'."\<Left>"
endfunc
inoremap " <C-R>=ReDoubleQuotaionMark()<CR>

func ReEnter()
    if getline('.')[col('.') - 1] == '}' &&
                \ getline('.')[col('.') - 2] == '{'
        return "\<CR>\<CR>\<Up>\<Tab>"
    endif
    return "\<CR>"
endfunc
inoremap <CR> <C-R>=ReEnter()<CR>

func ReBackspace()
    if (getline('.')[col('.') - 1] == '"' && getline('.')[col('.') - 2] == '"') ||
                \ (getline('.')[col('.') - 1] == "'" && getline('.')[col('.') - 2] == "'")
        return "\<BACKSPACE>\<Right>"
    elseif (getline('.')[col('.') - 1] == ')' && getline('.')[col('.') - 2] == '(') ||
                \ (getline('.')[col('.') - 1] == ']' && getline('.')[col('.') - 2] == '[') ||
                \ (getline('.')[col('.') - 1] == '}' && getline('.')[col('.') - 2] == '{')
        return "\<Right>\<BACKSPACE>\<BACKSPACE>"
    endif
    return "\<BACKSPACE>"
endfunc
inoremap <BACKSPACE> <C-R>=ReBackspace()<CR>
inoremap <C-h> <C-R>=ReBackspace()<CR>

"
" cmap for CommandLine
