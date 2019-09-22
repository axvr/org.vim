" =============================================================
" Description:  Folding for GNU Emacs' Outline mode
" Author:       Alex Vear (axvr) <av@axvr.io>
" Licence:      ISC (2019)
" =============================================================

function! OutlineFold()
    let l:depth = match(getline(v:lnum), '\(^\*\+\)\@<=\( .*$\)\@=')
    if l:depth > 0 && synIDattr(synID(v:lnum, 1, 1), 'name') =~# 'outlineHeading'
        return ">" . l:depth
    endif
    return "="
endfunction

setlocal foldexpr=OutlineFold()
setlocal foldmethod=expr
