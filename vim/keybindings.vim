let mapleader=" "
nnoremap <leader>e :Ex<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set encoding=utf8
" tab and shift tab to switch buffers?
nnoremap <leader><tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>
"Close the buffer like lazy vim 
nnoremap <leader>bd :bd<CR>

" switch colorscheme like lazyvim
let g:my_themes = ['tokyonight','everforest']
let g:idx=0 "length of my_theme array

function! CycleThemes()
    let g:idx = (g:idx + 1) % len(g:my_themes)
    execute 'colorscheme ' . g:my_themes[g:idx]
    echo "Theme Applied: ". g:my_themes[g:idx]
endfunction
" binding to change theme
nnoremap <leader>uc :call CycleThemes()<CR>


