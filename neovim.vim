" vim: set foldmethod=marker :

if has("nvim")
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set bg=dark

  " Fix errors with kitty when termguicolors is set
  " see https://github.com/kovidgoyal/kitty/issues/160#issuecomment-341027936
  let &t_8f = '\e[38;2;%lu;%lu;%lum'
  let &t_8b = '\e[48;2;%lu;%lu;%lum'

  " {{{ Terminal mode
  "
  " Escape to switch back to normal mode
  tnoremap <Esc> <C-\><C-n>
  " Control-V + Escape to insert Escape
  tnoremap <C-v><Esc> <Esc>

  " Highlight terminal mode cursor
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15


  " Use neovim-remote to open main neovim sessions when launching neovim within
  " a neovim terminal session
  " Thanks to https://pragprog.com/book/modvim/modern-vim for the tip!
  "
  " see https://github.com/mhinz/neovim-remote
  " nvr is a tool that helps controlling nvim processes.
  "
  " It does two things:
  "   * adds back the --remote family of options (see man vim)
  "   * helps controlling the current nvim from within :terminal
  if executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
  " }}}

  let test#strategy = 'neomake'

endif
