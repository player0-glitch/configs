set rnu

filetype plugin indent on 
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set wrap
syntax on

" Change cursor size based on the mode
" n-v-c: block cursor normal-visual-command modes
" i: thinner cursor when inserting
" r-cr: underline when in Replace Mode
" set guicursor=n-v-c:block,i-ci:ver25-Cursor
"treat dashed words as one word for dw/ciw/diw
set iskeyword+=- 
set laststatus=2
set backspace=indent,eol,start

"""""""""""""""""
" Helper functions
""""""""""""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"Set desert color scheme
 colorscheme desert 
" Shows current position
set ruler
" highlight when searching
set hlsearch
"Show matching braces
set showmatch

set encoding=utf8


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Status line must always be shown
set laststatus=2
set statusline=\ [\%{HasPaste()}%F%m%r%h]\ %w\ \ :\%r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" $-4 Should move to the absolute end of a line
" set virtualedit=onemore
" nnoremap $ $l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


