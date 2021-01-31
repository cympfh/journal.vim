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
        end
    else
        echo "Space.vim cannot do anything useful here..."
    end

endfunction

nnoremap <buffer> <Space> :call <SID>Space()<CR>
