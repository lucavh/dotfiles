# dotfiles

This repository helps set up and maintain my macOS configuration. Follow the steps below to quickly set up a fresh macOS environment with my preferred settings and tools.

## Repository Structure

- **bootstrap.sh**: The main entry point. Syncs files and triggers the brew installer.
- **brew.sh**: Installs Homebrew and runs the Brewfile.
- **Brewfile**: A list of all CLI tools and Cask apps (e.g., Ghostty, TablePlus).
- **zshrc**: Shell configuration, aliases, and plugin initialization.
- **ghostty/config**: Your Batman-themed terminal configuration.

## A Fresh macOS Setup

### Pre-Installation Checklist

Before starting, ensure you:

- Commit and push all changes to GitHub.
- Clean your Desktop, Downloads, and other default folders.
- Back up your 1Password security files.
- Export important data from your local database.
- Store all license keys securely.

### Clean Installation

1. Perform a clean macOS installation.
2. Enable FileVault during setup.

### Setting Up Your Environment

1. **Update macOS**: Install the latest version via the App Store.
2. **Install Xcode Command Line Tools**: Run `xcode-select --install`.
3. **Set Up Local Folder Structure**: `mkdir -p ~/Projects`.
4. **Clone This Repository**:

   ```bash
   git clone https://github.com/lucavh/dotfiles.git ~/Projects/dotfiles
   cd ~/Projects/dotfiles
   ```

5. **Run the Bootstrapper**:

   ```bash
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

   This script will install Homebrew, fetch all dependencies (e.g., Ghostty, Zoxide), and link your configuration files.

## Post-Installation Tweaks

### Terminal (Ghostty) & Shell (Zsh + Zoxide)

- Your terminal setup is automated with a custom Batman-inspired theme and settings defined in `ghostty/config`.
- **Config**: Use `Cmd + Shift + ,` to reload the configuration.
- **Jump**: Use `z [directory]` to jump to frequently used folders (powered by Zoxide).
- **Search**: Press `Ctrl + R` for a fuzzy search of your command history (powered by fzf).
- **Autocomplete**: Use the arrow keys to accept greyed-out suggestions.

### macOS System Preferences

- **Fix Dock**:
  - System Settings > Desktop & Dock > Automatically hide and show the Dock: On
  - System Settings > Desktop & Dock > Show recent applications in Dock: Off
  - Remove any unwanted apps from the Dock.
- **Fix Display**:
  - Fix display resolution: System Preferences > Displays > Resolution > Scaled > More Space.
  - Change desktop image: System Preferences > Desktop & Screensaver > Colours > #1D262A.

## Manual App Checklist

After running the setup script, manually log in or install the following apps via SetApp:

- CleanMyMac X
- Sip
- **DisplayLink**: Download drivers manually from [DisplayLink.com](https://www.displaylink.com/).
