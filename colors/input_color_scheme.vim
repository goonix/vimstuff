" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolor"
hi Normal		guifg=White		guibg=black
"hi Comment	term=bold		ctermfg=LightBlue		guifg=yellow "need to try.. same as ls
"colour81
hi Comment	term=bold		ctermfg=NONE guifg=#00E000
hi Constant	term=underline	ctermfg=NONE guifg=Magenta
hi Special	term=bold		ctermfg=NONE guifg=Red
hi Identifier term=underline	cterm=bold			ctermfg=NONE guifg=#40ffff
"hi Statement term=bold		ctermfg=NONE guifg=#aa4444
hi Statement term=bold		ctermfg=NONE gui=bold	guifg=#aa4444
hi PreProc	term=underline	ctermfg=NONE guifg=#ff80ff
hi Type	term=underline		ctermfg=NONE gui=bold
hi Function	term=bold		ctermfg=NONE guifg=White
hi Repeat	term=underline	ctermfg=NONE guifg=white
hi Operator				ctermfg=NONE guifg=Red
hi Ignore				ctermfg=NONE guifg=bg
hi Error	term=reverse ctermbg=NONE guifg=White
hi Todo	term=standout ctermbg=NONE guibg=Yellow

hi javaClassDecl ctermfg=NONE guifg=#00d0d0
hi javaScopeDecl ctermfg=NONE guifg=#00d0d0
hi Special ctermfg=NONE guifg=#ff8080
hi javaDocTags ctermfg=NONE guifg=#D9E577
hi javaDocComment ctermfg=NONE guifg=#ccdf32
hi javaDocParam ctermfg=NONE guifg=#ccdf32
hi javaOperator ctermfg=NONE guifg=#00d0d0
hi javaStorageClass ctermfg=NONE guifg=#00d0d0
hi javaString ctermfg=NONE guifg=#DC78DC
hi javaType ctermfg=NONE guifg=#00d0d0
hi javaTypeDef ctermfg=NONE guifg=#00d0d0
hi javaCommentTitle ctermfg=NONE guifg=#ccdf32
hi javaNumber ctermfg=NONE guifg=#ffff00
"hi Normal ctermfg=NONE guifg=#ff0000
hi phpIdentifier ctermfg=NONE guifg=#79ABFF

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
