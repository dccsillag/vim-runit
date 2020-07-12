function! s:OpenTerminal(Command, ...)
    if &modified
        let l:ans = input("Buffer has been modified. Are you sure you want to load it into the REPL? (y/N) ")
        if l:ans != "y"
            echomsg "Canceled."
            return
        end
    endif

    let l:fname = expand("%")

    if exists("b:runit_syntax")
        let l:syntax = b:runit_syntax
    endif

    if has("nvim")
        new
        if exists("l:syntax")
            execute "setf " . l:syntax
        endif
        let l:ret = termopen(a:Command(l:fname))
        setl nonumber norelativenumber foldcolumn=0
        for Cmd in a:000
            call chansend(l:ret, Cmd(l:fname))
        endfor
        normal! i
    else
        let l:ret = term_start(a:Command(l:fname), #{ term_finish: 'close' })
        for Cmd in a:000
            call term_sendkeys(l:ret, Cmd(l:fname))
        endfor
    endif

    return l:ret
endfunction

function! s:GetVar(varname)
    if !exists(a:varname)
        throw a:varname . " isn't defined"
    else
        return eval(a:varname)
    endif
endfunction

function! s:RunIt()
    call s:OpenTerminal(s:GetVar("b:runit_exec"))
endfunction

function! s:ReplIt()
    call s:OpenTerminal(s:GetVar("b:runit_repl"), s:GetVar("b:runit_init"))
endfunction

nnoremap <Plug>(RunIt) :call <SID>RunIt()<CR>
nnoremap <Plug>(ReplIt) :call <SID>ReplIt()<CR>
