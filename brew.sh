#!/usr/bin/env bash

set -e

# Shared functions

pretty_print() {
    printf "\n%b\n" "$1"
}

# Installing Homebrew

if ! command -v brew &>/dev/null; then
    pretty_print "💁‍♀️ Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
        pretty_print "💁‍♀️ Put Homebrew location earlier in PATH..."
        printf '\n# recommended by brew doctor\n' >> ~/.zshrc
        printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
        export PATH="/usr/local/bin:$PATH"

        # These commands are to add Homebrew to your PATH:
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    pretty_print "🙆‍♀️ You already have Homebrew installed... good job!"
fi

# Updating brew

pretty_print "💁‍♀️ Updating brew formulas..."
brew update

# Installing essentials

pretty_print "💁‍♀️ Installing essentials..."
brew bundle
