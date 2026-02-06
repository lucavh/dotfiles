# 🔧 dotfiles

> My personal macOS development environment configuration

[![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?style=flat&logo=homebrew&logoColor=black)](https://brew.sh/)
[![Zsh](https://img.shields.io/badge/Shell-Zsh-1A2C34?style=flat&logo=gnu-bash&logoColor=white)](https://www.zsh.org/)

This repository contains my dotfiles and automated setup scripts for
quickly configuring a fresh macOS environment with my preferred tools,
settings, and workflows.

## ✨ Features

- 🚀 **One-command setup** - Bootstrap a complete development environment
- 🍺 **Homebrew automation** - Install all tools and apps via Brewfile
- 🎨 **Custom terminal** - Beautiful Ghostty configuration with JetBrains Mono Nerd Font
- ⚡ **Optimized Zsh** - Fast shell startup with lazy-loading plugins
- 🔄 **Live sync** - Symlinked configs for instant updates
- ✅ **Pre-commit hooks** - Automated code quality checks

## 📁 Repository Structure

| File | Description |
|------|-------------|
| `bootstrap.sh` | Main entry point - syncs files and triggers installation |
| `brew.sh` | Homebrew installer and dependency manager |
| `Brewfile` | Declarative list of CLI tools and applications |
| `zshrc` | Shell configuration with aliases and optimized plugins |
| `ghostty/config` | Terminal emulator settings and theme |
| `.gitconfig` | Git aliases and default settings |

## 🚀 Quick Start

### Prerequisites

- macOS (tested on latest versions)
- Admin access to install Homebrew and applications
- Internet connection

### Installation

```bash
# 1. Clone this repository
git clone https://github.com/lucavh/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles

# 2. Run the bootstrap script
chmod +x bootstrap.sh
./bootstrap.sh
```

The script will:
1. ✅ Install Homebrew (if not present)
2. ✅ Install all packages and applications from Brewfile
3. ✅ Symlink configuration files to your home directory
4. ✅ Set up pre-commit hooks

### What Gets Installed

<details>
<summary><b>Development Tools</b></summary>

- **Version Control**: Git, Git LFS, GitHub CLI
- **Shell Enhancements**: Zsh, Zoxide, fzf, Zsh plugins
- **Utilities**: wget, tree, jq, virtualenv
</details>

<details>
<summary><b>Applications (via Homebrew Cask)</b></summary>

- **Productivity**: 1Password, Maccy, Rectangle, Obsidian
- **Development**: Visual Studio Code, Docker, Ghostty
- **Communication**: Slack, Signal, Telegram
- **Design**: Sketch, Pika, ColorSnapper
- **Browsers**: Google Chrome
- **Other**: Spotify, Google Drive, Bambu Studio
</details>

<details>
<summary><b>Fonts</b></summary>

- JetBrains Mono Nerd Font
- Fira Code Nerd Font
- Hack Nerd Font
- Plus: Barlow, Lato, Open Sans, Roboto, Ubuntu, Source Code Pro
</details>

## 🔄 Fresh macOS Setup Guide

### Pre-Installation Checklist

Before wiping your machine:

- [ ] Commit and push all code changes to GitHub
- [ ] Back up 1Password security data
- [ ] Export important database data
- [ ] Clean Desktop, Downloads, and Documents folders
- [ ] Store all license keys securely
- [ ] Document any custom system settings

### Clean Installation Steps

1. **Prepare Installation Media** (optional for clean install)
   - Download macOS from App Store
   - Create bootable USB if needed

2. **Install macOS**
   - Wipe disk and perform clean installation
   - Enable FileVault encryption during setup

3. **Initial Setup**
   ```bash
   # Update macOS
   # System Settings > General > Software Update

   # Install Xcode Command Line Tools
   xcode-select --install

   # Create project directory
   mkdir -p ~/Projects

   # Clone and run dotfiles
   git clone https://github.com/lucavh/dotfiles.git ~/Projects/dotfiles
   cd ~/Projects/dotfiles
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

## ⚙️ Post-Installation Configuration

### Terminal & Shell Features

Your Zsh environment comes with powerful productivity enhancements:

| Feature | Command/Shortcut | Description |
|---------|------------------|-------------|
| **Jump** | `z [directory]` | Smart directory jumping (via Zoxide) |
| **History Search** | `Ctrl + R` | Fuzzy search command history (via fzf) |
| **Autosuggestions** | `→` or `Tab` | Accept greyed-out suggestions |
| **Reload Config** | `reload` | Refresh shell configuration |
| **Git Shortcuts** | `gs`, `ga`, `gc`, `gp`, `gl` | Quick git commands |

#### Ghostty Terminal

- **Reload Config**: `Cmd + Shift + ,`
- **Font**: JetBrains Mono Nerd Font (14pt)
- **Theme**: GitHub Dark Dimmed
- **Config Location**: `~/.config/ghostty/config`

### macOS System Settings

<details>
<summary><b>Dock Configuration</b></summary>

- **System Settings** > **Desktop & Dock**
  - ✅ Automatically hide and show the Dock
  - ❌ Show recent applications in Dock
  - Remove unwanted default apps from Dock
</details>

<details>
<summary><b>Display Settings</b></summary>

- **System Settings** > **Displays**
  - Resolution: **Scaled** > **More Space**
- **System Settings** > **Desktop & Screensaver**
  - Desktop Color: `#1D262A` (dark theme)
</details>

<details>
<summary><b>Keyboard & Trackpad</b></summary>

- **System Settings** > **Keyboard**
  - Key repeat rate: Fast
  - Delay until repeat: Short
- **System Settings** > **Trackpad**
  - Tracking speed: Fast
  - ✅ Tap to click
</details>

## 📝 Manual Steps

Some apps require manual installation or configuration:

### SetApp Applications

Install via [SetApp](https://setapp.com/) subscription:
- CleanMyMac X
- ~~Sip~~ (replaced by Pika/ColorSnapper)

### Additional Drivers

- **DisplayLink**: Download from
  [displaylink.com](https://www.displaylink.com/downloads) for external
  monitor support

## 🛠️ Maintenance

### Updating Everything

```bash
# Update Homebrew and packages
brew update && brew upgrade && brew cleanup

# Update macOS App Store apps
mas upgrade

# Reload shell configuration
reload
```

### Syncing Changes

After modifying dotfiles in the repository:

```bash
cd ~/Projects/dotfiles
git pull origin main
./bootstrap.sh
```

Configuration files are symlinked, so direct edits to `~/.zshrc` or
`~/.config/ghostty/config` automatically update the repository files.

## 📚 Useful Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `dot` | `cd ~/Projects/dotfiles` | Navigate to dotfiles |
| `batcave` | `cd ~/Projects/dotfiles` | Alternate dotfiles alias |
| `gcfg` | `nano ~/.config/ghostty/config` | Edit terminal config |
| `zcfg` | `nano ~/.zshrc` | Edit shell config |
| `reload` | `source ~/.zshrc` | Reload shell |
| `gs` | `git status` | Git status |
| `ga` | `git add` | Git add |
| `gc` | `git commit` | Git commit |
| `gp` | `git push` | Git push |
| `gl` | `git log --oneline --graph --decorate` | Pretty git log |

## 🤝 Contributing

This is a personal repository, but feel free to fork it and adapt it to your needs!

## 📄 License

MIT License - feel free to use and modify as needed.
