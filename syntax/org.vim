" Vim syntax file for GNU Emacs' Org mode
"
" Maintainer:   Alex Vear <av@axvr.io>
" License:      Vim (see `:help license`)
" Location:     syntax/org.vim
" Website:      https://github.com/axvr/org.vim
" Last Change:  2019-09-22
"
" Reference Specification: Org mode manual
"   GNU Info: `$ info Org`
"   Web: <https://orgmode.org/manual/index.html>

if exists("b:current_syntax")
    finish
endif

" Enable spell check for non syntax highlighted text
syntax spell toplevel

" Bold, underine, italic, etc.
syntax region orgItalic        matchgroup=orgItalicDelimiter        start="\/\S\@=\/\@!" end="\S\@<=\/\@<!\/" keepend contains=@Spell oneline
syntax region orgBold          matchgroup=orgBoldDelimiter          start="\*\S\@=\*\@!" end="\S\@<=\*\@<!\*" keepend contains=@Spell oneline
syntax region orgUnderline     matchgroup=orgUnderlineDelimiter     start="_\S\@=_\@!"   end="\S\@<=_\@<!_"   keepend contains=@Spell oneline
syntax region orgStrikethrough matchgroup=orgStrikethroughDelimiter start="+\S\@=+\@!"   end="\S\@<=+\@<!+"   keepend contains=@Spell oneline

if org#option('org_use_italics', 0)
    highlight def orgItalic term=italic cterm=italic gui=italic
else
    highlight def orgItalic term=none cterm=none gui=none
endif

highlight def orgBold term=bold cterm=bold gui=bold
highlight def orgUnderline term=underline cterm=underline gui=underline
highlight def link orgItalicDelimiter    orgItalic
highlight def link orgBoldDelimiter      orgBold
highlight def link orgUnderlineDelimiter orgUnderline


" Options
syntax match  orgOption /^\s*#+\w\+.*$/ keepend
syntax region orgTitle matchgroup=orgOption start="^\s*#+TITLE:\s*" end="$" keepend oneline

highlight def link orgBlockDelimiter SpecialComment
highlight def link orgOption SpecialComment
highlight def link orgTitle Title


" Code and vervatim text
syntax region orgCode     matchgroup=orgCodeDelimiter start="\S\@<==\|=\S\@=" end="\S\@<==\|=\S\@=" keepend oneline
syntax region orgVerbatim matchgroup=orgVerbatimDelimiter start="\S\@<=\~\|\~\S\@=" end="\S\@<=\~\|\~\S\@=" keepend oneline
syntax match  orgVerbatim /^\s*: .*$/ keepend
syntax region orgVerbatim matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_.*"      end="^\s*#+END_.*"      keepend
syntax region orgCode     matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_SRC"     end="^\s*#+END_SRC"     keepend
syntax region orgCode     matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_EXAMPLE" end="^\s*#+END_EXAMPLE" keepend

highlight def link orgVerbatim Identifier
highlight def link orgVerbatimDelimiter orgVerbatim
highlight def link orgCode Statement
highlight def link orgCodeDelimiter orgCode


" Comments
syntax match  orgComment /^\s*#\s\+.*$/ keepend
syntax region orgComment matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_COMMENT" end="^\s*#+END_COMMENT" keepend
highlight def link orgComment Comment


" Headings
syntax match orgHeading1 /^\s*\*\{1}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeading2 /^\s*\*\{2}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeading3 /^\s*\*\{3}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeading4 /^\s*\*\{4}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeading5 /^\s*\*\{5}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeading6 /^\s*\*\{6,}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo

syntax match orgTag /:\w\{-}:/ contained contains=orgTag
exec 'syntax keyword orgTodo contained ' . join(g:org_state_keywords, ' ')

hi def link orgHeading1 Title
hi def link orgHeading2 orgHeading1
hi def link orgHeading3 orgHeading2
hi def link orgHeading4 orgHeading3
hi def link orgHeading5 orgHeading4
hi def link orgHeading6 orgHeading5
highlight def link orgTodo Todo
highlight def link orgTag Type


" Timestamps
syntax match orgTimestampActive /<\d\{4}-\d\{2}-\d\{2}.\{-}>/ keepend
syntax match orgTimestampInactive /\[\d\{4}-\d\{2}-\d\{2}.\{-}\]/ keepend
highlight def link orgTimestampActive Operator
highlight def link orgTimestampInactive Comment


" Hyperlinks
syntax match orgHyperlink /\[\{2}\([^][]\{-1,}\]\[\)\?[^][]\{-1,}\]\{2}/ containedin=ALL contains=orgHyperLeft,orgHyperRight,orgHyperURL
syntax match orgHyperLeft /\[\{2}/ contained conceal
syntax match orgHyperRight /\]\{2}/ contained conceal
syntax match orgHyperURL /[^][]\{-1,}\]\[/ contained conceal
highlight def link orgHyperlink Underlined


" Tables
syntax match orgTable /^|.*$/ contains=@Spell,orgBold,orgItalic,orgUnderline,orgVerbatim,orgCode
if org#option('org_hightlight_table_background', 1)
    highlight def link orgTable ColorColumn
endif


let b:current_syntax = 'org'
