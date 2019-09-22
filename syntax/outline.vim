" =============================================================
" Description:  Syntax file for GNU Emacs' Outline mode
" Author:       Alex Vear (axvr) <av@axvr.io>
" Licence:      ISC (2019)
" =============================================================

if exists("b:current_syntax")
    finish
endif

" Enable spell check for non syntax highlighted text
syntax spell toplevel

" Headings
syntax match outlineHeading1 /^\s*\*\{1}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading2 /^\s*\*\{2}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading3 /^\s*\*\{3}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading4 /^\s*\*\{4}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading5 /^\s*\*\{5}\s\+.*$/ keepend contains=@Spell
syntax match outlineHeading6 /^\s*\*\{6,}\s\+.*$/ keepend contains=@Spell

hi def link outlineHeading1 Title
hi def link outlineHeading2 outlineHeading1
hi def link outlineHeading3 outlineHeading2
hi def link outlineHeading4 outlineHeading3
hi def link outlineHeading5 outlineHeading4
hi def link outlineHeading6 outlineHeading5

let b:current_syntax = 'org'
