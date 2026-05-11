set runtimepath+=~/.vim/plugged/vim-lsp

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
