function! s:newjournal()
    let filepath = g:journal_dir . strftime("%Y%m%d.md")
    execute "edit " . filepath
    if ! filereadable(filepath) " new file
        call setline(1, "# " . strftime("%a %d %b %Y"))
    end
    call setline(line("$") + 1, "## " . strftime("%H:%M:%S"))
    call setline(line("$") + 1, "")
    normal G
endfunction

function! s:toggle()
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
    end

endfunction

command! -nargs=0 JournalNew call <sid>newjournal()
command! -nargs=0 JournalToggle call <sid>toggle()
