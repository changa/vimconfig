if has('nvim')
  autocmd! BufWritePost * Neomake

  " Automatically open the quickfix list on errors, but without moving the
  " cursor from the buffer
  let g:neomake_open_list = 2
endif
