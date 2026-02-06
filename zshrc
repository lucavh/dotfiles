# Cache brew prefix for performance
BREW_PREFIX="${BREW_PREFIX:-/opt/homebrew}"
[[ ! -d "$BREW_PREFIX" ]] && BREW_PREFIX="/usr/local"

# 1. THE JUMP COMMAND (zoxide) - Lazy loaded on first use
function z() {
  unfunction z
  eval "$(zoxide init zsh)"
  z "$@"
}

# 2. AUTO-SUGGESTIONS & SYNTAX HIGHLIGHTING - Load immediately but efficiently
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# 3. FUZZY FINDER - Lazy load keybindings
export PATH="$PATH:$BREW_PREFIX/opt/fzf/bin"
function _fzf_init() {
  unfunction _fzf_init
  eval "$(fzf --zsh)"
}
# Override default fzf functions to trigger lazy load
for func in fzf-file-widget fzf-cd-widget fzf-history-widget; do
  eval "function $func() { _fzf_init; $func }"
done

# 6. HISTORY SETTINGS
# These ensure terminal remembers what I typed even after a restart.
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY      # Share history between different terminal windows
setopt APPEND_HISTORY     # Append to history file rather than overwriting

# 7. CUSTOM ALIASES
alias gcfg='nano ~/.config/ghostty/config'
alias zcfg='nano ~/.zshrc'
alias reload='source ~/.zshrc'
alias batcave='cd ~/src/dotfiles'
alias dot='cd ~/src/dotfiles'

# 8. CUSTOM PROMPT
# Shows: (venv) directory (branch) >
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f > '
