au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
