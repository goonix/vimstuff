" Here are John's
" vimrc settings
"set wm=8        " set wrapmargin
"set nohls       " turn off highlight on search

set nocp
syntax on
filetype on
filetype plugin on
filetype indent on
set scrolloff=999
set history=999
set hls       " turn on highlight on search

"mapping to clear highlighted search results
nnoremap <Esc> :noh<return><Esc>
set et          " turn on expand tab
" colorscheme adjustments :hi lists the symbols and values for this
"colo evening    " change the colorscheme
"enable 256 colors
set t_Co=256
"colo mycolor     " change the colorscheme
colo recogneyes " change the colorscheme
"syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" make the preprocessor stuff a lighter color
"hi PreProc ctermfg=yellow
"hi Constant cterm=underline,bold ctermfg=9
"hi CursorLine   cterm=NONE ctermbg=66 ctermfg=159 guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=8 guibg=darkred guifg=white
set cursorline
"hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
"hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000
hi StatusLine term=bold,reverse cterm=bold ctermbg=101 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000
" turn on comment continuation for C style comments
set fo+=r       " formatoptions r adds new comment line automagically
" only apply on C comments, and mail forwarding "> "
set com=s1:/*,mb:*,ex:*/,:>,fb:-
set ruler
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ [%{&ff}]\ %P
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"
" AUTO-COMMANDS
" for Makefiles
" added some special formatting in Makefiles
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent list
"lcs=tab:>-,trail:x
" for source code
autocmd BufEnter *.cpp,*.h,*.c,*.java,*.pl,*.html,*.jsp,*.gsp,*.groovy,*.php,*.xml,*.pl,*.pm,*.py,*.js set et ts=4 sw=4 cindent 
" change the filetype
autocmd BufEnter *.pro,*.prolog set et ts=4 sw=4 cindent ft=prolog
" for html
"autocmd BufEnter *.html set et ts=4 sw=4 wm=8 nocindent
"autocmd BufEnter *.html,*.gsp set et ts=4 sw=4 filetype=htmlm4
autocmd BufEnter *.html,*.gsp set et ts=4 sw=4 filetype=html
autocmd BufEnter,BufNewFile,BufRead *.json set et ts=4 sw=4 ft=javascript
"autocmd BufEnter,BufRead,BufWritePost * :UpdateTypesFile "reread TagHighlight stuff
"autocmd BufWritePost * :UpdateTypesFile "reread TagHighlight stuff
autocmd FileWritePost * :UpdateTypesFile "reread TagHighlight stuff
"let delimitMate_expand_cr = 1
let delimitMate_expand_cr = 0 "switched off for 7.3

" Setup Rainbow Parentheses plugin
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" abbreviations
"ab teh the
"ab tomarrow tomorrow
" The man plugin does lookup with control-k, or :Man
"runtime ftplugin/man.vim
"Quick write session with F2
"unmap <F2>
"map <F2> :mksession! ~/Documents/my_default_session.vim <cr>
"And load session with F3
" unmap <F3>
" map <F3> :source ~/Documents/my_default_session.vim <cr>
"unmap <C-N>
"Control n to open a new tab
map <C-N> :tabnew <cr>
"set the proprietary title ;)
"set title titlestring=MYpad

"if has('gui_running')
"   set columns=80
"endif

"system dependent stuff
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "mosborn-pc" && has('gui_running')
   set lines=54
   set columns=120
" elseif hostname == "mac"
"    ...
endif

"plugin stuff
call pathogen#infect()
let mapleader = '\'
map <leader>g :GundoToggle<CR> 
nmap <leader>a <Esc>:Ack!
nmap <leader>ct <Esc>:call system('etags --recurse=yes *')
map <leader>td <Plug>TaskList
noremap <leader>us :UpdateTypesFile<CR>
noremap <leader>cac :%ArrangeColumn<CR>

"format JSON
map <Leader>fj !python -m json.tool<CR>
"reread .vimrc
map <Leader>rr :so $MYVIMRC<CR>

:highlight SignColumn ctermbg=0
:highlight lineAdded ctermfg=NONE
:highlight lineModified ctermfg=NONE
:highlight lineRemoved ctermfg=NONE
let g:gitgutter_highlight_lines = 0

runtime macros/matchit.vim

"""""""""""""""""""""
" additional mappings
"""""""""""""""""""""
if has('gui_running')
   nnoremap <leader>p "+p
   nnoremap <leader>P "+P
endif

""""""""""
"functions
""""""""""

"Wahler, R. "vim restores cursor position; exclude special files"
"http://stackoverflow.com/questions/2393671/vim-restores-cursor-position-exclude-special-files
"(Accessed September 2012)
function! PositionCursorFromViminfo()
  if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction
autocmd BufReadPost * call PositionCursorFromViminfo()


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

"toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
  else
    augroup maxCurrWin
        " au BufEnter * wincmd _ | wincmd |
        "
        " only max it vertically
        au! WinEnter * wincmd _
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
" nnoremap <Leader>max :call ToggleMaxWins()<CR>
nnoremap <Leader>o :call ToggleMaxWins()<CR>
