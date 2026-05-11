" turns on diagnostics highlighting 
let lspOpts = #{autohighlightDiags: v:true}
autocmd  User LspSetup call LspOptionsSet(lspOpts)

" This is a super minimal config
" So i'll only add lsp support for C/C++,Rust
" LazyVim has all the bells and whistles i need
"
let lspServers = [
            \#{
            \   name:'rust-analyzer',
            \   filetypes: ['rust'],
            \   path: 'rust-analyzer',
            \   args: []
            \},
            \#{
            \   name: 'clangd',
            \   filetypes: ['c','cpp','h','hpp'],
            \   path: '/usr/bin/clangd',
            \   args:['--background-index','--clang-tidy']
            \}
            \]
""""
filetype plugin indent on
syntax on

"Register servers

if executable('clangd') 
    au user lsp_setup call lsp#register_server({
                \'name':'clangd',
                \'cmd':{server_info['clangd']},
                \'allowlist':['c','cpp'],
                \})
endif
"""""
autocmd User LspSetup call LspAddServer(lspServers)

"Should probably move all these keymaps to ./Keybindings.vim
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>

nnoremap <leader>x  :LspDiag current<CR>
nnoremap <leader>xn :LspDiag next \| LspDiag current<CR>
nnoremap <leader>xp :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

"Some key maps for code suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

autocmd FileType php,c setlocal omnifunc=lsp#complete
autocmd FileType php,c inoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
" autocmd FileType php,c autocmd InsertCharPre <buffer> if getline('.')[col('.')-2] =~ '\k' | call feedkeys("\<C-x><C-o>",'n')|endif


"Custom diagnostic icons
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \})

autocmd BufWritePre *.c,*.cpp silent! LspFormat
