function! s:Space()
    let l:line = getline('.')

    if &filetype == "markdown"
        " Checkbox
        if l:line =~ '\-\s\[\s\]'
            let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '') . ' [' . strftime("%Y/%m/%d (%a) %H:%M") . ']'
            call setline('.', l:result)
            echo "Checkbox on"
        elseif l:line =~ '\-\s\[x\]'
            let l:result = substitute(substitute(l:line, '-\s\[x\]', '- [ ]', ''), '\s\[\d\{4}.\+]$', '', '')
            call setline('.', l:result)
            echo "Checkbox off"
        " (NONE) -> TODO -> DONE -> (NONE)
        elseif l:line =~ '\-\sTODO\s'
            let l:result = substitute(l:line, '-\sTODO', '- DONE', '')
            call setline('.', l:result)
            echo "TODO -> DONE"
        elseif l:line =~ '\-\sDONE\s'
            let l:result = substitute(l:line, '-\sDONE', '-', '')
            call setline('.', l:result)
            echo "DONE -> (NONE)"
        elseif l:line =~ '\-\s'
            let l:result = substitute(l:line, '-\s', '- TODO ', '')
            call setline('.', l:result)
            echo "(NONE) -> TODO"
        end
    else
        echo "Space.vim cannot do anything useful here..."
    end

endfunction

nnoremap <buffer> <Space> :call <SID>Space()<CR>
