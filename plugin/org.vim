" Set default configuration options for org.vim
"
" Maintainer:   Alex Vear <av@axvr.io>
" License:      Vim (see `:help license`)
" Location:     plugin/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2019-09-22

" Fallback chain for options. Buffer local --> Global --> default.
function org#option(name, default)
    return get(b:, a:name, get(g:, a:name, a:default))
endfunction

if !exists('g:org_state_keywords')
    let g:org_state_keywords = ['TODO', 'NEXT', 'DONE']
endif
