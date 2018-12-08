" =============================================================
" Description:  Configure Org-mode folding
" Author:       Alex Vear (axvr)
" Licence:      ISC (2018)
" =============================================================

setlocal conceallevel=2
setlocal commentstring=#%s

function! OrgFold()
    let l:depth = match(getline(v:lnum), '\(^\*\+\)\@<=\( .*$\)\@=')
    if l:depth > 0 && synIDattr(synID(v:lnum, 1, 1), 'name') ~=# 'orgHeading'
        return ">" . l:depth
    endif
    return "="
endfunction

setlocal foldexpr=OrgFold()
setlocal foldmethod=expr

" Make folds more readable
setlocal foldtext=getline(v:foldstart)
setlocal fillchars-=fold:-
setlocal fillchars+=fold:\ 

" TODO add working links?
