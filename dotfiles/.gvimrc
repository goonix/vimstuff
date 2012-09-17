" Here are John's
" vimrc settings
"set wm=8        " set wrapmargin
set nohls       " turn off highlight on search
set et          " turn on expand tab
" colorscheme adjustments :hi lists the symbols and values for this
"colo evening    " change the colorscheme
colo mycolor     " change the colorscheme
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
"
" abbreviations
"ab teh the
"ab tomarrow tomorrow
" The man plugin does lookup with control-k, or :Man
"runtime ftplugin/man.vim
"Quick write session with F2
unmap <F2>
map <F2> :mksession! ~/Documents/my_default_session.vim <cr>
"And load session with F3
unmap <F3>
map <F3> :source ~/Documents/my_default_session.vim <cr>
"unmap <C-N>
"Control n to open a new tab
map <C-N> :tabnew <cr>
"set the proprietary title ;)
set title titlestring=MYpad
set columns=80

"plugin stuff
call pathogen#infect()
let mapleader = '\'
map <leader>g :GundoToggle<CR> 
nmap <leader>a <Esc>:Ack!

