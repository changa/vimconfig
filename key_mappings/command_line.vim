" vim: syntax=on : filetype=vim:

" set <Leader> to , (comma)
let mapleader = ","

" INDENTATION {{{
vnoremap < <gv
vnoremap > >gv
" }}}

" TABS {{{

" next tab
map <C-Left>  :tabprevious<CR>

" previous tab
map <C-Right> :tabnext<CR>
" }}}

" BUFFERS {{{

" Close current buffer
nnoremap <C-w><C-d> :bd<cr>

" Switch to previous buffer from history
nnoremap <C-PageUp> :bp<cr>

" Switch to previous buffer in history
nnoremap <C-PageDown> :bn<cr>

" }}}

" SELECTION {{{

" Visually select the text that was last edited/pasted
" see http://vimcasts.org/episodes/bubbling-text
nmap gV `[v`]

" }}}

" FOLDING {{{

" use <F8> to open/close a fold
nnoremap <F8> za

" use <Shift-F8> to open/close folds recursively
nnoremap <S-F8> zA

" use <Control-F8> to open all folds
nnoremap <C-F8> zR

" use <Shift-Control-F8> to close all folds
nnoremap <C-S-F8> zM
" }}}

" COLUMN MARKERS {{{
" Use F10 to toggle the highlighting of the current column
noremap <F10> :set cursorcolumn!<CR>
" }}}

" FILE EXPANSION {{{
" Easy Expansion of the Active File Directory
"
" Now when we type %% on Vim’s : command-line prompt, it automatically expands
" to the path of the active buffer, just as though we had typed %:h <Tab>
" taken from Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Set a binding to insert the current filename
noremap! \fn <C-R>=expand("%")<CR>
" }}}


" {{{ CONFIG RELOADING

" CTRL-R reloads the ~/.vimrc file
noremap <C-R> call ReloadSource()<CR>

" }}}

" RELATIVE LINE NUMBERING {{{

" Toggle relative line numbering function...
function! ToggleRnu()
  if exists("l:nornu")
    set rnu
  else
    set nu
  end
endfunction
"  and bind it to F11
noremap <silent> <C-F11> :se rnu!<CR>
" }}}

" {{{ COPY AND PASTE
" Toggle paste mode when pasting from elsewhere
nnoremap <F5> :set invpaste paste?<CR>
" }}}

" {{{ MISC

" No more 'Entering Ex mode'
" see http://stackoverflow.com/questions/1269689/to-disable-entering-ex-mode-in-vim
map Q <Nop>
" }}}
