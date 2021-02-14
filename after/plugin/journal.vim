if ! exists("g:journal_dir")
    let g:journal_dir = "~/Dropbox/org/journal/"
end

if ! exists("g:journal_new")
    let g:journal_new = "<C-c><C-j>"
end

if ! exists("g:journal_toggle")
    let g:journal_toggle = "<C-c><C-c>"
end

execute "nnoremap " . g:journal_new . " :JournalNew<cr>"
execute "nnoremap " . g:journal_toggle . " :JournalToggle<cr>"
