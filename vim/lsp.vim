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
            \   filetype: ['rust'],
            \   path: 'rust-analyzer',
            \   args: []
            \},
            \#{
            \   name: 'clangd',
            \   filetype: ['c','cpp'],
            \   path: 'clangd',
            \   args:['--background-index','--clang-tidy']
            \}
            \]

autocmd User LspSetup call LspAddServer(lspServers)

"Should probably move all these keymaps to ./Keybindings.vim
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap <leader>x  :LspDiag current<CR>
nnoremap <leader>xn :LspDiag next \| LspDiag current<CR>
nnoremap <leader>xp :LspDiag prev \| LspDiag current<CR>

nnorema <silent> <C-space> <C-x><C-o>
" autocmd FileType php setlocal omnifunc=lsp#complete

"Custom diagnostic icons
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \})
"Allowing tabbing into Pop-Up-Menu code suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"Shift-Tab is already used to go to the previous buffer

" Format on save (because of clangd)
augroup LspFormatOnSave
    autocmd!
    autocmd BufWritePre *.c,*.cpp,*.h,*.hpp LspFormat
augroup END

"Use Enter key to confirm selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
