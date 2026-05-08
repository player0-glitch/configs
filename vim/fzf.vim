" FZF Keymaps requires pluggin 'junegunn/fzf.vim'

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffer<CR>
nnoremap <leader>fq :CList<CR> "idk what a quick fix list is
nnoremap <leader>fh :Helptags<CR>

" Grep for current File name"
nnoremap <leader>fc :execute 'Rq ' . expand('%:t:r')<CR>

" Grep for the input word i guess
nnoremap <leader>fg :Rg<Space>

" Grep for the current string 
nnoremap <leader>fs :Rg <C-r><C-w><CR>
