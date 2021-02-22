change_node_version:
	nvm install 14.15.5

delete_prefix:
	nvm use --delete-prefix v14.15.5

version_node_npm:
	@echo "node ver.: `node -v`"
	@echo "npm ver.:  `npm -v`"

# make git m="your message"
git:									## Git add, commit and push all in one command
	git add .
	git commit -m "$m"
	git push
	git status
