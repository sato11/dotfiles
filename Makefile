EXCLUSIONS := .DS_Store .git .gitignore
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

fetch:
	test -f .vim/colors/solarized.vim || (mkdir -p .vim/colors && curl -o .vim/colors/solarized.vim -O https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim)
	./homebrew.sh
	./vscode.sh
	@echo ''

install: update fetch deploy

unlink:
	@echo '==> Unlinking dotfiles.'
	@-$(foreach val, $(DOTFILES), unlink $(HOME)/$(val) && echo Removed $(HOME)/$(val);)

update:
	git pull origin main
	@echo ''
