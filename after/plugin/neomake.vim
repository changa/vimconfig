if has('nvim')
  autocmd! BufWritePost * Neomake

  " Automatically open the quickfix list on errors, but without moving the
  " cursor from the buffer
  let g:neomake_open_list = 2


  " Do not use mix compile to detect changed files, as this breaks Phoenix's
  " file change detection
  " see https://github.com/phoenixframework/phoenix/issues/1165
  let g:neomake_elixir_enabled_makers = ['elixir']
  let g:neomake_elixir_elixir_maker = {
        \ 'exe': 'elixirc',
        \ 'args': [
          \ '--ignore-module-conflict', '--warnings-as-errors',
          \ '--app', 'mix', '--app', 'ex_unit',
          \ '-o', '$TMPDIR', '%:p'
        \ ],
        \ 'errorformat':
            \ '%E** %s %f:%l: %m,' .
            \ '%W%f:%l'
        \ }
endif
