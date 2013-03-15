" vim: set foldmethod=marker :

set nocompatible

" Load flavors from VimFlavor file
" see https://github.com/kana/vim-flavor
runtime flavors/bootstrap.vim

" {{{ Basics

set number     " always show line numbers
set hlsearch   " highlight searches by default
set smartcase  " …unless they contain a capital letter
set cursorline " Show current line with a marker
set autoread   " Automatically reload an externally modified file
set visualbell
set hidden     " Avoid asking to save before hiding

"
" Indentation
"
set autoindent
set smartindent
set smarttab
set expandtab
set shiftround
set nojoinspaces
set nofoldenable
set tabstop=2
set softtabstop=2
set shiftwidth=2

"
" Soft/Hard Wrapping
"
set wrap
set textwidth=79
set formatoptions=qrn1

"
" History and backup
"
set viminfo='10,:20,\"100,%,n~/.viminfo
set history=1000
set nobackup
set nowritebackup
set noswapfile

" Spaces and tabs
"
set listchars=nbsp:·,tab:»–,trail:·
set list

" Color long lines limit
autocmd BufRead,BufNewFile,BufWinEnter * highlight ColorColumn ctermbg=DarkGrey ctermfg=white guibg=#222

if exists('+colorcolumn')
  if exists('textwidth')
    autocmd BufRead,BufNewFile,BufWinEnter * set colorcolumn=+1
  else
    autocmd BufRead,BufNewFile,BufWinEnter * set colorcolumn=81
  end
else
  au BufRead,BufWinEnter * match ColorColumn /\%81v./
endif

" Status line
set statusline=
set statusline+=%3.3n\                       " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%1*%m%r%w%0*               " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}%{&bomb?'/bom':''}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%{fugitive#statusline()}     " show git status
set statusline+=%=                           " right align

" Syntastic status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=\

set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set laststatus=2
" }}}

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

" {{{ Load key mappings

exec 'source ' . expand("~/.vim/key_mappings/command_line.vim")
exec 'source ' . expand("~/.vim/key_mappings/gui.vim")
" }}}

" {{{ Skeletons

augroup skeletons
  au!
  :autocmd BufNewFile  *.rb,*.rake 0r ~/.vim/skeletons/skeleton.rb
  :autocmd BufNewFile  *.sh        0r ~/.vim/skeletons/skeleton.sh

  " Go directly to third line and start in insertion mode
  :autocmd BufNewFile  *.rb,*.rake,*.sh :normal 3G
  :autocmd BufNewFile  *.rb,*.rake,*.sh :startinsert
augroup END

" }}}
colorscheme Tomorrow-Night-Bright

if has("autocmd")
    " Save on focusLost
    autocmd FocusLost * :silent! wall
endif

" {{{ FOOTER - LOCAL CUSTOMIZATIONS

" Always leave this at the very end of the file
if filereadable(expand("~/vimrc.local"))
  " This file can be used to override global settings
  exec 'source ' . expand("~/vimrc.local")
endif
" }}}
