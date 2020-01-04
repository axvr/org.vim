" Vim filetype plugin for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <av@axvr.io>
" License:      Vim (see `:help license`)
" Location:     ftplugin/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2020-01-04
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

setlocal commentstring=#%s

setlocal foldexpr=org#fold_expr()
setlocal foldmethod=expr

if org#option('org_clean_folds', 0)
    setlocal foldtext=org#fold_text()
    setlocal fillchars-=fold:-
    setlocal fillchars-=fold:\
endif

" Conceal Org mode link syntax
if org#option('org_conceal_links', 1)
    setlocal conceallevel=2
    setlocal concealcursor=nc
endif
