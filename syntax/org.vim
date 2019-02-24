" =============================================================
" Description:  Basic Org-mode syntax highlighting
" Author:       Alex Vear (axvr)
" Licence:      ISC (2018)
" =============================================================

if exists("b:current_syntax")
    finish
endif

" FIXME spell checking does not work on standard lines.

syntax region orgItalic matchgroup=orgItalicDelimiter start="\S\@<=\/\|\/\S\@=" end="\S\@<=\/\|\/\S\@=" keepend contains=@Spell concealends oneline
syntax region orgBold   matchgroup=orgBoldDelimiter   start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=@Spell concealends oneline
syntax region orgUnderline matchgroup=orgUnderlineDelimiter start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=@Spell concealends oneline
syntax region orgStrikethrough start="\S\@<=+\|+\S\@=" end="\S\@<=+\|+\S\@=" keepend contains=@Spell concealends oneline

syntax match  orgOption /^\s*#+\w\+.*$/ keepend
syntax region orgTitle matchgroup=orgOption start="^\s*#+TITLE:\s*" end="$" keepend oneline

syntax region orgCode     matchgroup=orgCodeDelimiter start="\S\@<==\|=\S\@=" end="\S\@<==\|=\S\@=" keepend concealends oneline
syntax region orgVerbatim matchgroup=orgVerbatimDelimiter start="\S\@<=\~\|\~\S\@=" end="\S\@<=\~\|\~\S\@=" keepend concealends oneline
syntax match  orgVerbatim /^\s*: .*$/ keepend
syntax region orgVerbatim matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_.*"      end="^\s*#+END_.*"      keepend
syntax region orgCode     matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_SRC"     end="^\s*#+END_SRC"     keepend
syntax region orgCode     matchgroup=orgBlockDelimiter start="^\s*#+BEGIN_EXAMPLE" end="^\s*#+END_EXAMPLE" keepend


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
syntax match orgTag /:\w\{-}:/ contained contains=orgTag
" TODO make these words configurable
syntax keyword orgTodo contained TODO NEXT DONE


" Timestamp
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
highlight def link orgTable ColorColumn


highlight def orgItalic    term=italic    cterm=italic    gui=italic
highlight def orgBold      term=bold      cterm=bold      gui=bold
highlight def orgUnderline term=underline cterm=underline gui=underline
highlight def link orgItalicDelimiter    orgItalic
highlight def link orgBoldDelimiter      orgBold
highlight def link orgUnderlineDelimiter orgUnderline

highlight def link orgHeading1 htmlH1
highlight def link orgHeading2 htmlH2
highlight def link orgHeading3 htmlH3
highlight def link orgHeading4 htmlH4
highlight def link orgHeading5 htmlH5
highlight def link orgHeading6 htmlH6
highlight def link orgTodo Todo
highlight def link orgTag Constant

highlight def link orgVerbatim          Delimiter
highlight def link orgVerbatimDelimiter orgVerbatim
highlight def link orgCode              Statement
highlight def link orgCodeDelimiter     orgCode

highlight def link orgBlockDelimiter SpecialComment
highlight def link orgOption Constant
highlight def link orgTitle Function


let b:current_syntax = 'org'
