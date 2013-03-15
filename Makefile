install: ~/.vimrc ~/.gvimrc vim-flavor make_dirs

~/.vimrc:
	ln -s `pwd`/vimrc ~/.vimrc

~/.gvimrc:
	ln -s `pwd`/gvimrc ~/.gvimrc

install-vim-flavor:
	gem install vim-flavor --version '>= 1.1.2' --conservative

vim-flavor: install-vim-flavor
	vim-flavor install

configure_vim_sensible: make_dirs

make_dirs:
	mkdir -p ~/.cache/vim/undo \
		~/.cache/vim/swap \
		~/.cache/vim/backup \
		~/.cache/vim/undo \
