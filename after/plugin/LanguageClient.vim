autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
