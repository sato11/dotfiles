EXCLUSIONS := .DS_Store .git .gitignore .aliases
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

fetch:
	test -f git-completion.bash || curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	test -f git-prompt.sh || curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
	@echo ''

install: update fetch deploy

unlink:
	@echo '==> Unlinking dotfiles.'
	@-$(foreach val, $(DOTFILES), unlink $(HOME)/$(val) && echo Removed $(HOME)/$(val);)

update:
	git pull origin master
	@echo ''
