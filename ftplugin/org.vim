" Vim filetype plugin for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <av@axvr.io>
" License:      Vim (see `:help license`)
" Location:     ftplugin/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2019-09-22
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

setlocal commentstring=#%s

function! OrgFold()
    let l:depth = match(getline(v:lnum), '\(^\*\+\)\@<=\( .*$\)\@=')
    if l:depth > 0 && synIDattr(synID(v:lnum, 1, 1), 'name') =~# 'orgHeading'
        return ">" . l:depth
    endif
    return "="
endfunction

setlocal foldexpr=OrgFold()
setlocal foldmethod=expr

" Conceal Org mode link syntax
if org#option('org_conceal_links', 1)
    setlocal conceallevel=2
    setlocal concealcursor=nc
endif

" Make Vim fold's look more like Org mode folds.
if org#option('org_clean_folds', 0)
    setlocal foldtext=getline(v:foldstart)
    setlocal fillchars-=fold:-
    setlocal fillchars+=fold:\ 
endif
