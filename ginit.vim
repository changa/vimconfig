if exists('g:GtkGuiLoaded')
  " some code here
endif

if filereadable(expand("~/.vim/ginit.vim.local"))
  exec 'source ' . expand('~/.vim/ginit.vim.local')
endif
