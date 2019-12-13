#!/bin/sh
if command -v code >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi
	mkdir -p "$VSCODE_HOME/User"

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
	allenshuber.quote-flipper
	bhughes339.replacerules
	bierner.markdown-preview-github-styles
	bmewburn.vscode-intelephense-client
	christian-kohler.path-intellisense
	chunsen.bracket-select
	clinyong.vscode-css-modules
	CoenraadS.bracket-pair-colorizer
	ctf0.macros
	dakara.dakara-foldplus
	dbaeumer.jshint
	dbaeumer.vscode-eslint
	dbankier.vscode-quick-select
	eamodio.gitlens
	ecmel.vscode-html-css
	EditorConfig.EditorConfig
	eriklynd.json-tools
	fabiospampinato.vscode-monokai-night
	hedinne.stylelint-disable-snippets
	herrmannplatz.npm-dependency-links
	johnbillion.vscode-wordpress-hooks
	johnpapa.vscode-peacock
	kumar-harsh.graphql-for-vscode
	mgmcdermott.vscode-language-babel
	mikestead.dotenv
	mkaufman.HTMLHint
	monokai.theme-monokai-pro-vscode
	neilbrayfield.php-docblocker
	onecentlin.laravel-blade
	Orta.vscode-jest
	patbenatar.advanced-new-file
	persoderlind.vscode-phpcbf
	pnp.polacode
	ryu1kn.partial-diff
	Shan.code-settings-sync
	shevaua.phpcs
	shinnn.stylelint
	tobiasalthoff.atom-material-theme
	tomsaunders.vscode-workspace-explorer
	vincaslt.highlight-matching-tag
	wayou.vscode-todo-highlight
	wix.vscode-import-cost
	wordpresstoolbox.wordpress-toolbox
	wwm.better-align
	yzhang.markdown-all-in-one
	zengxingxin.sort-js-object-keys
	Zignd.html-css-class-completion
	"

	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
