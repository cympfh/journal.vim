syntax keyword spaceTODO TODO
syntax keyword spaceDONE DONE
syntax match spaceChecked "\[[xX]\]"
syntax match spaceUnChecked "\[\s\]"
syntax match spaceDatetime "\[[0-9]\{4,4}.*\]"

" For Hacking plastic-boy/vim-markdown
syn region mkdListItemLine start="^\s*\%([-*+]\|\d\+\.\)\s\+" end="$" oneline contains=@mkdNonListItem,mkdListItem,@Spell,spaceTODO,spaceDONE,spaceChecked,spaceUnChecked,spaceDatetime

highlight default link spaceTODO Todo
highlight default link spaceDONE NonText
highlight default link spaceChecked NonText
highlight default link spaceUnChecked Normal
highlight default link spaceDatetime NonText

let b:current_syntax = "mkd"
