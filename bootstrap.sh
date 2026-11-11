#!/usr/bin/env bash

# 1. Get the directory of this script
export DOTFILES_DIR=$(pwd)

# 2. Update the repo
echo "📥 Pulling latest changes..."
git pull origin main;

# 3. Run the brew script
if [ -f "./brew.sh" ]; then
    echo "🍺 Running Homebrew setup..."
    source ./brew.sh
fi

# 4. The Sync Function
function doIt() {
    echo "⚙️  Syncing files to home directory..."

    mkdir -p ~/.config/ghostty

    # RSYNC for general files (repo-only and symlinked files are excluded)
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "brew.sh" \
        --exclude "Brewfile" \
        --exclude "README.md" \
        --exclude ".gitignore" \
        --exclude ".pre-commit-config.yaml" \
        --exclude ".markdownlint.json" \
        --exclude "zshrc" \
        --exclude "ghostty/" \
        --exclude "mcp.sh" \
        --exclude "claude/" \
        -avh --no-perms . ~;

    # SYMLINKS for the important stuff, so edits in the repo are instant.
    # An existing real file (not a symlink) is backed up first.
    link() {
        local src="$1" dest="$2"
        if [ -e "$dest" ] && [ ! -L "$dest" ]; then
            local backup="$dest.backup-$(date +%d-%m-%Y)"
            echo "📦 Backing up $dest -> $backup"
            mv "$dest" "$backup"
        fi
        ln -sfn "$src" "$dest"
    }
    link "$DOTFILES_DIR/zshrc" ~/.zshrc
    link "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

    echo "✅ Setup complete! Welcome back, Luca."
    source ~/.zshrc
}

# Confirmation
read -p "This will sync your config. Proceed? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
fi;
