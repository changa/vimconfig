autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
set foldmethod=manual

if exists('+noballooneval')
  set noballooneval
endif

au BufEnter * syn match error contained "\<binding.pry\>"
au BufEnter * syn match error contained "\<debugger\>"
