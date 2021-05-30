if ! exists("g:journal_dir")
    let g:journal_dir = "~/Dropbox/org/journal/"
end

if ! exists("g:journal_new")
    let g:journal_new = "<C-j><C-j>"
end

if ! exists("g:journal_edit")
    let g:journal_edit = "<C-j><C-e>"
end

if ! exists("g:journal_toggle")
    let g:journal_toggle = "<C-j><C-x>"
end

if ! exists("g:journal_next")
    let g:journal_next = "<C-j><C-n>"
end

if ! exists("g:journal_prev")
    let g:journal_prev = "<C-j><C-p>"
end

if ! exists("g:journal_grep")
    let g:journal_grep = "<C-j><C-g>"
end

if ! exists("g:journal_tags")
    let g:journal_tags = "<C-j><C-t>"
end

execute "nnoremap " . g:journal_new . " :JournalNew<cr>"
execute "nnoremap " . g:journal_edit . " :e " . g:journal_dir . "/"
execute "nnoremap " . g:journal_grep . " :JournalGrep "
execute "nnoremap " . g:journal_tags . " :JournalTags "
au FileType markdown execute "nnoremap " . g:journal_toggle . " :JournalToggle<cr><esc>"
au FileType markdown execute "inoremap " . g:journal_toggle . " <esc>:JournalToggle<cr>a"
au FileType markdown execute "nnoremap " . g:journal_next . " :JournalNext<cr>"
au FileType markdown execute "nnoremap " . g:journal_prev . " :JournalPrev<cr>"
