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
3. White Xcode is installing, you could:
   - fix display resolution: System Preferences > Displays > Resolution > Scaled > More Space 
   - change desktop image: System Preferences > Desktop & Screensaver > Colours > #1D262A
   - adjust Dock: System Preferences > Dock & Menu Bar > Automaticall hide and show the Dock
   - adjust Dock: System Preferences > Dock & Menu Bar > Show recent applications in Dock (uncheck)
   - remove any unwanted apps from the Dock
   - setup a local project folder: `mkdir Projects`
4. Install macOS Command Line Tools by running 

```bash
xcode-select --install
```
5. Clone this repository into the Projects folder. Git will be installed along with Xcode, so you should be able to run the following without problems:

```bash
git clone https://github.com/lucavh/dotfiles.git
```

6. From this repo, run the following command to setup Homebrew and install essentials:

```bash
source brew.sh
```

7. Optimize iTerm settings:
   1. Install [`SF-Mono-Powerline` font](https://github.com/Twixes/SF-Mono-Powerline): `git clone https://github.com/Twixes/SF-Mono-Powerline.git`
   1. Set font and font-size: `iTerm > Settings > Profiles > Text > Font > Size > 12` & `Font > SF Mono Powerline`
   1. Set appearance theme: `iTerm > Settings > General > Appearance > Theme > Minimal`
   1. Download color profile

   ```
   $ cd Downloads
   $ curl -O https://raw.githubusercontent.com/slavkobojanic/horizon-iterm/master/Horizon.itermcolors
   ```

   1. Import and set color profile: `iTerm > Settings > Profiles > Default > Colors > Color Presets > Import` and select `Horizon.itermcolors`.

8. Install oh-my-zsh: 

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

9. Install zsh plug-ins:

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

10. Move the custom theme into the theme folder (run `source ~/.zshrc` to reload settings)

```
$ cp -R sorin_luca.zsh-theme ~/.oh-my-zsh/custom/themes/
```

11. Sync dotfiles. The bootstrapper script will pull in the latest version and copy the files to your home folder.

```
$ source bootstrap.sh
```

10. Install apps manually: 
   - From SetApp: 
      - Bartender
      - CleanMyMac X
      - CloudMounter
      - iStat Menu's
      - Filepane
      - Sip
      - TablePlus 
   - [DisplayLink Driver](https://www.displaylink.com/downloads/macos)
