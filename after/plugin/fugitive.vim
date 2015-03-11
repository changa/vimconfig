" Close fugitive buffers when we are done with them
" See http://mixandgo.com/blog/vim-config-for-rails-ninjas
autocmd BufReadPost fugitive://* set bufhidden=delete
