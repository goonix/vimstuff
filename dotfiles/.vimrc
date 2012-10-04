" Here are John's
" vimrc settings
"set wm=8        " set wrapmargin
"set nohls       " turn off highlight on search
set hls       " turn off highlight on search
"mapping to clear highlighted search results
nnoremap <esc> :noh<return><esc>
set et          " turn on expand tab
" colorscheme adjustments :hi lists the symbols and values for this
"colo evening    " change the colorscheme
"enable 256 colors
set t_Co=256
"colo mycolor     " change the colorscheme
colo input_256_20121002         " change the colorscheme
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" make the preprocessor stuff a lighter color
"hi PreProc ctermfg=yellow
"hi Constant cterm=underline,bold ctermfg=9
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
autocmd BufEnter *.cpp,*.h,*.c,*.java,*.pl,*.html,*.jsp,*.groovy,*.php,*.xml,*.pl,*.pm,*.py set et ts=4 sw=4 cindent 
" change the filetype
autocmd BufEnter *.pro,*.prolog set et ts=4 sw=4 cindent ft=prolog
" for html
"autocmd BufEnter *.html set et ts=4 sw=4 wm=8 nocindent
autocmd BufEnter *.html set et ts=4 sw=4
autocmd BufEnter,BufNewFile,BufRead *.json set et ts=4 sw=4 ft=javascript
autocmd BufEnter,BufRead,BufWritePost * :UpdateTypesFile "reread TagHighlight stuff
let delimitMate_expand_cr = 1
"
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

if has('gui_running')
   set columns=80
endif

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
map <leader>us :UpdateTypesFile<CR>

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
