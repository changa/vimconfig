autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
set foldmethod=manual

if exists('+noballooneval')
  set noballooneval
endif
