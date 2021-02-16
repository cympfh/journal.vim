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
let g:journal_new = "<C-c><C-j>"  " default
```

New markdown file `YYYYmmdd.md` will be created under `g:journal_dir`.

### Move to Prev/Next

```vim
let g:journal_next = "<C-c><C-n>"  # 1 day after
let g:journal_prev = "<C-c><C-p>"  # 1 day before
```

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
let g:journal_toggle = "<C-c><C-c>"  " default
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

## Syntax

Please load
[plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown) or
[sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).
