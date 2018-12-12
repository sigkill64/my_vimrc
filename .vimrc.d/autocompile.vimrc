" ---------------
" Auto compile
" ---------------

"autocmd BufNewFile,BufRead *.ino setfiletype ino

func! CompileGcc()
    exec "w"
    let compilecmd="!gcc % "
    let compileflag="-Wall -Werror -o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp " endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd.compileflag
endfunc

func! CompileGpp()
    exec "w"
    let compilecmd="!g++ % "
    let compileflag="-Wall -Werror -o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd.compileflag
endfunc

func! RunPython()
    exec "!python %"
endfunc

func! CompileJava()
    exec "!javac %"
endfunc

func! CompileArduino()
    exec "!arduino --board arduino:avr:uno --verify %"
endfunc

func! CompileTex()
    exec "!if [ \\! -d output ]; then if [ -e output ]; then rm -rf output; fi; mkdir output; fi; xelatex -output-directory=output %"
endfunc

func! OpenHTML()
    exec "!chromium -app=file://%:p"
endfunc

func! CompileCode()
    exec "w"
    if &filetype == "cpp"
            exec "call CompileGpp()"
    elseif &filetype == "c"
            exec "call CompileGcc()"
    elseif &filetype == "python"
            exec "call RunPython()"
    elseif &filetype == "java"
            exec "call CompileJava()"
    elseif &filetype == "ino"
            exec "call CompileArduino()"
    elseif &filetype == "tex"
            exec "call CompileTex()"
    elseif &filetype == "html"
            exec "call OpenHTML()"
    endif
endfunc

func! RunResult()
    if search("mpi\.h") != 0
        exec "!echo; mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "!echo; ./%<"
    elseif &filetype == "c"
        exec "!echo; ./%<"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "!echo; java %<"
    elseif &filetype == "ino"
        exec "!echo; arduino --board arduino:avr:ino --port /dev/ttyACM0 --upload %"
    elseif &filetype == "tex"
        exec "!echo; evince-previewer output/%<.pdf &"
    elseif &filetype == "html"
        exec "call OpenHTML()"
    endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>

map <F6> :call RunResult()<CR>
