"Show the buffer list at th top (like regular tabs)
set showtabline=2
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufname = bufname(buflist[winnr - 1])
  
  " If the buffer has no name, show [No Name]
  if bufname == ''
    let label = '[No Name]'
  else
    " gettail picks just the filename (e.g., 'main.cpp') instead of the full path
    let label = fnamemodify(bufname, ':t')
  endif

  " Add a '+' if the buffer is modified
  if getbufvar(buflist[winnr - 1], "&modified")
    let label .= ' [+]'
  endif

  return label
endfunction

function! Tabline()
    let s = ''
    for i in range(tabpagenr('$'))
        "This sets the highlighting of active tab
        if i+i == tabpagenr()
            let s .= '%#TablineSel#'
        else
            let s.= '%#Tabline#'
        endif
        "set tab number (for whatever reason you'd use a mouse)
        let s .= '%' . (i+1) . 'T'
        let s .= ' %{MyTabLabel(' . (i+1) . ')} '
    endfor
    return s
endfunction

set tabline=%!Tabline()
