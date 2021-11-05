# dotfiles

This repository serves as my way to help me setup and maintain my configuration for macOS. 
Everything needed to install my preferred setup of macOS is detailed in this readme.

## A fresh macOS setup

### Before re-install
- Did you commit and push all changes to github?
- Did you clean your Desktop, Downloads folder and other default folders?
- Did you back-up your 1password security files?
- Did you remember to export important data from your local database?
- Did you store all license keys? 

### Start fresh

After going to the checklist above and making sure you backed everything up, 
go ahead and do a clean macOS installation. During setup, make sure to enable FileVault. 

### Make it feel like home

Follow these install instructions to make your new setup feel like home:

1. Update macOS to the latest version with the App Store.
2. Install Xcode from the App Store.
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Setup Homebrew and install essentials 

```
$ source brew.sh
```

5. Optimize iTerm settings:
   1. Install [`SF-Mono-Powerline` font](https://github.com/Twixes/SF-Mono-Powerline)
   1. Set font and font-size: `iTerm > Preferences > Profiles > Text > Font > Size > 12` & `Font > SF Mono Powerline`
   1. Set appearance theme: `iTerm > Preferences > Appearance > Theme > Minimal`
   1. Download color profile

   ```
   $ cd Downloads
   $ curl -O https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors
   ```

   1. Set color profile: `iTerm2 > Preferences > Profiles > Default > Colors > Color Presets > Import` and select `One%20Dark.itermcolors`.

6. Install oh-my-zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
7. Install zsh plug-ins:

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

8. Install apps manually: 
   - From SetApp: 
      - Bartender
      - BetterTouchTool
      - CleanMyMac X
      - CloudMounter
      - iStat Menu's
      - Sip
      - TablePlus 
   - [DisplayLink Driver](https://www.displaylink.com/downloads/macos)
9. Sync dotfiles. The bootstrapper script will pull in the latest version and copy the files to your home folder.

```
git clone https://github.com/mathiasbynens/dotfiles.git && cd dotfiles && source bootstrap.sh
```