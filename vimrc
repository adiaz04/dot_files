set tags=./tags;
cs add cscope.out

"
" A function to trim whitespace from files.
"
fun! s:trim_whitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

"
" Highlight trailing whitespace
"
highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws /\s\+$/

"
" Automatically trim whitespace from .c and .h files on save.
"
autocmd BufWritePre *,*.conf,*.c,*.h,*.S,Makefile,*.groovy,*.xml,*.py :call s:trim_whitespace()
set undodir=~/.vim/undodir

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"
" Disable swap files
"
set noswapfile

"
" Highlight seaches
"
set hlsearch

"
" Show line numbers
"
set number

"
" Highlight colums over 80 characters
"
"if exists('+colorcolumn')
"    set colorcolumn=80
"else
"    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

highlight ColorColumn ctermbg=red "set to whatever you like
call matchadd('ColorColumn', '\%81v', 100) "set column nr
"augroup collumnLimit
"    autocmd!
"    autocmd BufEnter,WinEnter
"        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
"    let collumnLimit = 80 " feel free to customize
"    let pattern =
"        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
"    autocmd BufEnter,WinEnter,FileType scala,java
"        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
"augroup END
