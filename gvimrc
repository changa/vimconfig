" hide toolbars and menu by default
" (use F10 to toggle back, see key_mappings/gui.vim)
set guioptions-=T
set guioptions-=m

" Highlight wrong spelling
highlight SpellBad term=underline gui=undercurl guisp=Orange

" Use system clipboard
set clipboard=unnamed

if filereadable(expand("~/.vim/gvimrc.local"))
  exec 'source ' . expand('~/.vim/gvimrc.local')
endif
