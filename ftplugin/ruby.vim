autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
set foldmethod=syntax

if exists('+noballooneval')
  set noballooneval
endif
