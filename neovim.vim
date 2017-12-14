" vim: set foldmethod=marker :

if has("nvim")
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set bg=dark

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

endif
