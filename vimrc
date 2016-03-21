set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'fatih/vim-go'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'taglist.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'winmanager'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80
set colorcolumn=+1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nu
set autoindent
set smartindent

"set mouse=a
set wildmode=longest,list,full
set wildmenu

syntax on

"vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"if filereadable("./tags")
"    set tags=tags
"endif

if filereadable("./cscope.out")
    cs add cscope.out
endif

"let g:miniBufExplMapWindowNavArrows = 1
let g:winManagerWindowLayout='TagList,FileExplorer|BufExplorer'
let g:persistentBehaviour=0
nnoremap <silent> <F8> :WMToggle<CR>

"file explorer tree style
let g:netrw_liststyle= 4

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

"nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

let Tlist_Show_One_File=1           "只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1         "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1        "在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1    "自动折叠
"let Tlist_Use_SingleClick=1

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
