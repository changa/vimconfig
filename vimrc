" vim: set foldmethod=marker :

set nocompatible


set number " always show line numbers


" Load flavors from VimFlavor file
" see https://github.com/kana/vim-flavor
runtime flavors/bootstrap.vim

" {{{ Whitespace clean-up

" Also see http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Remove trailing spaces
augroup strip_whitespaces
  au!
  autocmd FileType ruby autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  autocmd FileType markdown autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  autocmd FileType vim autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

" }}}

" {{{ Spaces and tabs
"
set listchars=nbsp:·,tab:»–,trail:·
set list
" }}}

" {{{ Load key mappings

exec 'source ' . expand("~/.vim/key_mappings/command_line.vim")
exec 'source ' . expand("~/.vim/key_mappings/gui.vim")
" }}}

colorscheme Tomorrow-Night-Bright

if has("autocmd")
    " Save on focusLost
    autocmd FocusLost * :silent! wall
endif

" {{{ FOOTER - LOCAL CUSTOMIZATIONS

" Always leave this at the very end of the file
if filereadable(expand("./vimrc.local"))
  " This file can be used to override global settings
  source ./vimrc.local
endif
" }}}
