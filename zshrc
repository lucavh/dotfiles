# 1. THE JUMP COMMAND (zoxide)
eval "$(zoxide init zsh)"

# 2. AUTO-SUGGESTIONS & HIGHLIGHTING
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# 3. FUZZY FINDER (fzf)
# This enables the CTRL+R history search and tab-completion for paths.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 4. HISTORY SETTINGS
# These ensure terminal remembers what I typed even after a restart.
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY      # Share history between different terminal windows
setopt APPEND_HISTORY     # Append to history file rather than overwriting

# 5. CUSTOM ALIASES
alias gcfg='nano ~/.config/ghostty/config'
alias zcfg='nano ~/.zshrc'
alias reload='source ~/.zshrc'
alias batcave='cd ~/src/dotfiles'
alias dot='cd ~/src/dotfiles'