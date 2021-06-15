" Vim filetype detect plugin for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <alex@vear.uk>
" License:      Vim (see `:help license`)
" Location:     ftplugin/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2019-09-22
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

autocmd BufRead,BufNewFile *.org setfiletype org
