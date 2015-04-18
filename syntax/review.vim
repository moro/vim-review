" Vim syntax file
" Language:		ReVIEW
" Version:		0

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match reviewCaption1  "^=\({.*}\)\?\s\+.\+"
syn match reviewCaption2  "^==\({.*}\)\?\s\+.\+"
syn match reviewCaption3  "^===\({.*}\)\?\s\+.\+"
syn match reviewCaption4  "^====\({.*}\)\?\s\+.\+"
syn match reviewColumn    "^=\+\[column\]\s\+.\+"
syn match reviewFootnote  "^//footnote\[.*\]\[.*\]"

syn match reviewNoindent  "//noindent"
syn match reviewLinebreak "//linebreak"
syn match reviewPagebreak "//pagebreak"

syn match reviewUnorderedList "^\s\+\*\s\+.*"
syn match reviewOrderedList   "^\s\+[0-9]\+\.\s\+.*"
syn match reviewDefinitions   "^\s\+\:\s\+.*"

syn match reviewArbitaryBlock "^//[a-z]\+\[.*\]"
syn region reviewRead   start="^//read{" end="^//}"
syn region reviewList   start="^//list\[.*\]\[.*\]{" end="^//}"
syn region reviewEmlist start="^//emlist{" end="^//}"
syn region reviewCmdCap start="^//cmd{" end="^//}"
syn region reviewQuote  start="^//quote{" end="^//}"
syn region reviewImage  start="^//image\[.*\]\[.*\]{" end="^//}"
syn region reviewTable  start="^//table\[.*\]\[.*\]{" end="^//}"
syn match reviewRef      "@<[a-z]\+>{.\{-\}}"

syn match reviewComment "^#@#.*"
syn match reviewWarn "^#@warn(.*)"
syn match reviewRequire "^#@require\s"
syn match reviewProvide "^#@provide\s"
syn region reviewMapfile start="^#@mapfile(.*)" end="#@end"
syn region reviewMaprange start="^#@maprange(.*)" end="#@end"
syn region reviewMapoutput start="^#@mapoutput(.*)" end="#@end"

command -nargs=+ HiLink hi def link <args>
HiLink reviewCaption1  Title
HiLink reviewCaption2  Constant
HiLink reviewCaption3  Identifier
HiLink reviewCaption4  Statement
HiLink reviewColumn    Statement
HiLink reviewFootnote  Statement

HiLink reviewNoindent  NonText
HiLink reviewLinebreak NonText
HiLink reviewPagebreak NonText

HiLink reviewUnorderedList Special
HiLink reviewOrderedList   Special
HiLink reviewDefinitions   Special

HiLink reviewArbitaryBlock Type
HiLink reviewRead      Preproc
HiLink reviewList      Preproc
HiLink reviewEmlist    Preproc
HiLink reviewCmdCap    Preproc
HiLink reviewQuote     Preproc
HiLink reviewImage     NonText
HiLink reviewTable     NonText
HiLink reviewRef       Label

HiLink reviewComment   Comment
HiLink reviewWarn      WarningMsg
HiLink reviewRequire   WarningMsg
HiLink reviewProvide   WarningMsg
HiLink reviewMapfile   WarningMsg
HiLink reviewMaprange  WarningMsg
HiLink reviewMapoutput WarningMsg
delcomman HiLink

let b:current_syntax = "review"
