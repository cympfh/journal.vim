if ! exists("g:journal_dir")
    let g:journal_dir = "~/Dropbox/org/journal/"
end

if ! exists("g:journal_new")
    let g:journal_new = "<C-c><C-j>"
end

if ! exists("g:journal_toggle")
    let g:journal_toggle = "<C-c><C-c>"
end

if ! exists("g:journal_next")
    let g:journal_next = "<C-c><C-n>"
end

if ! exists("g:journal_prev")
    let g:journal_prev = "<C-c><C-p>"
end

execute "nnoremap " . g:journal_new . " :JournalNew<cr>"
au FileType markdown execute "nnoremap " . g:journal_toggle . " :JournalToggle<cr>"
au FileType markdown execute "nnoremap " . g:journal_next . " :JournalNext<cr>"
au FileType markdown execute "nnoremap " . g:journal_prev . " :JournalPrev<cr>"
