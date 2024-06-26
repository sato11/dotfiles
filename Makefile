deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	ln -sfnv ~/dotfiles/.aliases ~/
	ln -sfnv ~/dotfiles/.asdfrc ~/
	ln -sfnv ~/dotfiles/.gemrc ~/
	ln -sfnv ~/dotfiles/.gitconfig ~/
	ln -sfnv ~/dotfiles/.gitconfig.local ~/
	ln -sfnv ~/dotfiles/.gitignore_global ~/
	ln -sfnv ~/dotfiles/.tmux.conf ~/
	ln -sfnv ~/dotfiles/.tool-versions ~/
	ln -sfnv ~/dotfiles/.vimrc ~/
	ln -sfnv ~/dotfiles/.zshrc ~/
	ln -sfnv ~/dotfiles/.vim ~/
	ln -sfnv ~/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -sfnv ~/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -sfnv ~/dotfiles/.vscode/snippets/cpp.json ~/Library/Application\ Support/Code/User/snippets/cpp.json
	ln -sfnv ~/dotfiles/bin ~/

fetch:
	test -f .vim/colors/solarized.vim || (mkdir -p .vim/colors && curl -o .vim/colors/solarized.vim -O https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim)
	./install-homebrew.sh
	brew bundle
	./asdf-plugins.sh
	asdf install
	./vscode.sh
	@echo ''

install: update fetch deploy

unlink:
	@echo '==> Unlinking dotfiles.'
	unlink ~/.aliases
	unlink ~/.gemrc
	unlink ~/.gitconfig
	unlink ~/.gitignore_global
	unlink ~/.tmux.conf
	unlink ~/.vimrc
	unlink ~/.zshrc
	unlink ~/.vim
	unlink ~/Library/Application\ Support/Code/User/keybindings.json
	unlink ~/Library/Application\ Support/Code/User/settings.json
	unlink ~/bin

update:
	git pull origin main
	@echo ''
