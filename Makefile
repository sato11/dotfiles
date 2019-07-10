EXCLUSIONS := .DS_Store .git .gitignore
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

fetch:
	test -f git-completion.bash || curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	test -f git-prompt.sh || curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
	test -f .vim/colors/solarized.vim || (mkdir -p .vim/colors && curl -o .vim/colors/solarized.vim -O https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim)
	./homebrew.sh
	@echo ''

install: update fetch deploy

unlink:
	@echo '==> Unlinking dotfiles.'
	@-$(foreach val, $(DOTFILES), unlink $(HOME)/$(val) && echo Removed $(HOME)/$(val);)

update:
	git pull origin master
	@echo ''
