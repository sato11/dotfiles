EXCLUSIONS := .DS_Store .git
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
