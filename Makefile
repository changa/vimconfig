install: ~/.vimrc vim-flavor make_undo_dir

~/.vimrc:
	ln -s `pwd`/vimrc ~/.vimrc

install-vim-flavor:
	gem install vim-flavor --version '>= 1.1.2' --conservative

vim-flavor: install-vim-flavor
	vim-flavor install

configure_vim_sensible: make_undo_dir

make_undo_dir:
	[ "`uname`" != "Linux" ] || mkdir -p ~/.local/share/vim/undo
	[ "`uname`" != "Darwin" ] || mkdir -p ~/Library/Vim/undo
