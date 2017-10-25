EXCLUSIONS := .DS_Store .git
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install: update deploy
	@exec $$SHELL

unlink:
	@echo '==> Unlinking dotfiles.'
	@-$(foreach val, $(DOTFILES), unlink $(HOME)/$(val) && echo Removed $(HOME)/$(val);)

update:
	git pull origin master
	@echo ''
