" Vim filetype plugin for GNU Emacs' Outline mode
"
" Maintainer:   Alex Vear <av@axvr.io>
" License:      Vim (see `:help license`)
" Location:     ftplugin/outline.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2019-09-22
"
" Reference Specification: GNU Emacs Manual, section 'Outline Mode'
"   GNU Info: `$ info Emacs Outline Mode`
"   Web: <https://www.gnu.org/software/emacs/manual/html_node/emacs/Outline-Mode.html>

function! OutlineFold()
    let l:depth = match(getline(v:lnum), '\(^\*\+\)\@<=\( .*$\)\@=')
    if l:depth > 0 && synIDattr(synID(v:lnum, 1, 1), 'name') =~# 'outlineHeading'
        return ">" . l:depth
    endif
    return "="
endfunction

setlocal foldexpr=OutlineFold()
setlocal foldmethod=expr
