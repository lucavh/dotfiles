#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "Brewfile" \
		--exclude "README.md" \
		--exclude "Horizon.itermcolors" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

doIt;

unset doIt;
