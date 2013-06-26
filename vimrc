set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

filetype on
filetype indent on
filetype plugin on

"for js files
nnoremap <F4> :call g:Jsbeautify()<CR>
"autocmd Filetype javascript,java call PairAutoComplete()

"auto indent files
nnoremap <F5> gg=G

"remember last open position
autocmd BufReadPost *
    \ if line("'\"")>0&&line("'\"")<=line("$") |
    \   exe "normal g'\"" |
    \ endif

"for java
autocmd Filetype java call JavaAucmd()

func JavaAucmd()
    setlocal omnifunc=javacomplete#Complete
    setlocal completefunc=javacomplete#CompleteParamsInfo
    inoremap <buffer> .<TAB> .<C-X><C-O><C-P><DOWN>
endfunc

"() {}... auto complate
func PairAutoComplete()
    inoremap ( ()<ESC>i
    inoremap { {<CR>}<ESC>O'
    inoremap { {<CR>}<ESC>O
    inoremap [ []<ESC>i
    inoremap " ""<ESC>i
    inoremap ' ''<ESC>i
endfunc

"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>

"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
