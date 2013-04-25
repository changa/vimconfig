" Use the text preceding the cursor to decide which type of
" completion to attempt.
let g:SuperTabDefaultCompletionType = "context"

" Setup the supertab chaining for any filetype that has a provided |omnifunc|
" to first try that, then fall back to supertab's default, <c-p>, completion:
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>")  |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif
