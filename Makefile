all: install README.markdown

install: ~/.vimrc ~/.gvimrc vim-flavor make_dirs

~/.vimrc:
	ln -s `pwd`/vimrc ~/.vimrc

~/.gvimrc:
	ln -s `pwd`/gvimrc ~/.gvimrc

install-vim-flavor:
	gem install vim-flavor --version '>= 1.1.3' --conservative

vim-flavor: install-vim-flavor
	vim-flavor install

configure_vim_sensible: make_dirs

make_dirs:
	mkdir -p ~/.cache/vim/undo \
		~/.cache/vim/swap \
		~/.cache/vim/backup \
		~/.cache/vim/undo \

README.markdown: VimFlavor
	./update_readme
