" Shamelessy taken from
" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
" and http://bling.github.io//blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/#comment-919769841

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" File searching like ctrlp.vim
nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert -auto-preview file_rec/async<CR>

" Search in buffers
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer -quick-match  buffer<CR>

" Yank history like yankring/yankstack
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank  history/yank<CR>

" Search MRU files
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru -quick-match file_mru<CR>

if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
endif

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--noheading --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
