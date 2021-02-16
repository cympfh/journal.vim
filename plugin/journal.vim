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

let s:journal_day_ago = 0

function! s:move(d)
    let s:journal_day_ago = s:journal_day_ago + a:d
    if (s:journal_day_ago < 0)
        let s:journal_day_ago = 0
        echo "Current buffer is newest!"
    else
        let f = system("date --date '" . s:journal_day_ago . " day ago' '+%Y%m%d.md'")
        execute "edit " . g:journal_dir . f
    endif
endfunction

function! s:grep(keyword)
    if executable("rg")
        cexpr system('rg --vimgrep ' . a:keyword . ' ' . g:journal_dir)
        call setqflist([], 'a', {'title' : 'ripgrep ' . a:keyword})
    else
        cexpr system('grep -n ' . a:keyword . ' ' . g:journal_dir . '/*')
        call setqflist([], 'a', {'title' : 'grep ' . a:keyword})
    endif
    copen
    let g:copend = 1
endfunction

command! -nargs=0 JournalNew call <sid>newjournal()
command! -nargs=0 JournalToggle call <sid>toggle()
command! -nargs=0 JournalPrev call <sid>move(1)
command! -nargs=0 JournalNext call <sid>move(-1)
command! -nargs=1 JournalGrep call <sid>grep(<f-args>)
