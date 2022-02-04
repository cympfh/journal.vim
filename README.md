# journal.vim

Inspired by `org-journal`.

With `journal.vim`, you can write down diary and ideas very easily.

## Setup

mkdir and,

```vim
let g:journal_dir = "~/Dropbox/org/journal"
Plug 'cympfh/journal.vim'
```

All commands can be remapped.

## Commands

### New journal

```vim
let g:journal_new = "<C-j><C-j>"  " default
```

New markdown file `YYYY/mmdd.md` will be created under `g:journal_dir`.

### Goto Prev/Next journal

```vim
let g:journal_next = "<C-j><C-n>"  # 1 day after
let g:journal_prev = "<C-j><C-p>"  # 1 day before
```

### Grep

```vim
let g:journal_grep = "<C-j><C-g>"
```

`:JournalGrep` command takes 1 argument for searching keyword (grep pattern).
This uses `ripgrep` if executable.

### Tags

```vim
let g:journal_tags = "<C-j><C-t>"
```

With 1 argument, `:JournalTags ...` does grep search (`ripgrep` recommended).
Without argumens, `:JournalTags` list up all tags.

## Journal Format

Basically journal files are just `markdown`.
Some features are appended.

### Checkbox

```
- [ ] hogehoge
- [ ] fugafuga
```

You can toggle the state with

```vim
let g:journal_toggle = "<C-j><C-x>"  " default
```

```
- [x] hogehoge [2021/01/28 (Thu) 14:03]
- [ ] fugafuga
```

### TODO State

```
- TODO hoge
```

The state are switched with `g:journal_toggle`.

### Tags

Identifiers `#...`  (e.g. `#idea` `#reading`) are tags.
Tags can be searched with `:JournalTags`.

## Syntax

Please load
[plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown) or
[sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).
