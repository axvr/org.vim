" =============================================================
" Description:  Basic Org-mode syntax highlighting
" Author:       Alex Vear (axvr) <av@axvr.io>
" Licence:      ISC (2019)
" =============================================================

if exists("b:current_syntax")
    finish
endif

" Enable spell check for non syntax highlighted text
syntax spell toplevel

" Bold, underine, italic, etc.
syntax region orgItalic matchgroup=orgItalicDelimiter start="\S\@<=\/\|\/\S\@=" end="\S\@<=\/\|\/\S\@=" keepend contains=@Spell oneline
syntax region orgBold   matchgroup=orgBoldDelimiter   start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=@Spell oneline
syntax region orgUnderline matchgroup=orgUnderlineDelimiter start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=@Spell oneline
syntax region orgStrikethrough start="\S\@<=+\|+\S\@=" end="\S\@<=+\|+\S\@=" keepend contains=@Spell oneline

if get(g:, 'org_use_italics', 0)
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
highlight def link orgOption Type
highlight def link orgTitle Function


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
syntax match orgHeading6 /^\s*\*\{6}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo
syntax match orgHeadingE /^\s*\*\{7,}\s\+.*$/ keepend contains=@Spell,orgTag,orgTodo

syntax match orgTag /:\w\{-}:/ contained contains=orgTag
exec 'syntax keyword orgTodo contained ' . join(g:org_state_keywords, ' ')

if hlexists('htmlH1')
    highlight def link orgHeading1 htmlH1
    highlight def link orgHeading2 htmlH2
    highlight def link orgHeading3 htmlH3
    highlight def link orgHeading4 htmlH4
    highlight def link orgHeading5 htmlH5
    highlight def link orgHeading6 htmlH6
    highlight def link orgHeadingE htmlH6
else
    hi def link orgHeading1 Constant
    hi def link orgHeading2 String
    hi def link orgHeading3 PreProc
    hi def link orgHeading4 PreProc
    hi def link orgHeading5 PreProc
    hi def link orgHeading6 PreProc
    hi def link orgHeadingE PreProc
endif

highlight def link orgTodo Todo
highlight def link orgTag Type


" Timestamps
syntax match orgTimestamp /<\d\{4}-\d\{2}-\d\{2}.\{-}>/ keepend
highlight def link orgTimestamp Operator


" Hyperlinks
syntax match orgHyperlink /\[\{2}\([^][]\{-1,}\]\[\)\?[^][]\{-1,}\]\{2}/ containedin=ALL contains=orgHyperLeft,orgHyperRight,orgHyperURL
syntax match orgHyperLeft /\[\{2}/ contained conceal
syntax match orgHyperRight /\]\{2}/ contained conceal
syntax match orgHyperURL /[^][]\{-1,}\]\[/ contained conceal
highlight def link orgHyperlink Underlined


" Tables
syntax match orgTable /^|.*$/ contains=@Spell,orgBold,orgItalic,orgUnderline,orgVerbatim,orgCode
if get(g:, 'org_hightlight_table_background', 1)
    highlight def link orgTable ColorColumn
endif


let b:current_syntax = 'org'
