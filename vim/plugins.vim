" Tony said to ignore this line in the vimrc
 let s:plugin_dir=expand('~/.vim/plugged')

" Add vim-lsp ot the runtime 
set runtimepath+=~/vim/plugged/vim-lsp
"Enable file types
filetype plugin indent on
syntax on

" Helpper function to install plugin if not installed
function! s:ensure(repo)
    let name = split(a:repo,'/')[-1]
    let path = s:plugin_dir . '/' . name

    if !isdirectory(path)
      if !isdirectory(s:plugin_dir)
        call mkdir(s:plugin_dir,'p')
      endif
      execute '!git clone --depth=1 https://github.com/' .a:repo . ' ' .shellescape(path)
    endif

    execute 'set runtimepath+=' . fnameescape(path)
 endfunction

" Your plugins
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('tomasiser/vim-code-dark')
call s:ensure('ghifarit53/tokyonight-vim')
call s:ensure('yegappan/lsp')
call s:ensure('ojroques/vim-oscyank')
call s:ensure('tpope/vim-commentary')
call s:ensure('itchyny/lightline.vim')
call s:ensure('yegappan/lsp')
"Plugins for everforest 
call s:ensure('sainnhe/everforest')
