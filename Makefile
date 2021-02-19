change_node_version:
	nvm install 14.15.5

delete_prefix:
	nvm use --delete-prefix v14.15.5

version_node_npm:
	@echo "node ver.: `node -v`"
	@echo "npm ver.:  `npm -v`"
