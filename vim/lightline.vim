set laststatus=2
let g:lightline = {
      \ 'colorscheme' : 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'tabline':{
      \     'left':[['buffers']],
      \     'right':[['close']],
      \ },
      \ 'component_expands':{
      \     'buffers':'lightline#bufferline#buffers'},
      \ 'component-type':{
      \     'buffers':'tabsel'
      \ },
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:lightline.colorscheme = 'everforest'
