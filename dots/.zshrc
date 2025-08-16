export BREW_HOME="/opt/homebrew"
export PATH="$BREW_HOME/bin:$PATH"
if [[ -f "$BREW_HOME/bin/brew" ]] then
  eval "$($BREW_HOME/bin/brew shellenv)"
fi
export HOMEBREW_NO_ENV_HINTS=1

if [[ ":$FPATH:" != *":~/.zsh/completions:"* ]]; then
  export FPATH="~/.zsh/completions:$FPATH"
fi

alias e-zsh='nvim ~/.zshrc'
alias r-zsh='source ~/.zshrc'
alias fman='comgen -c | fzf | xargs man'
alias ls='ls -a --color'
alias fz='nvim $(fzf --preview="bat --color=always {}")'
alias r-nix='home-manager switch --flake ~/.config/nix#me-nix'

source $BREW_HOME/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $BREW_HOME/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_HOME/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U compinit && compinit

# Disable commands underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# History setup
SAVEHIST=1000
HISTFILE=~/.zhistory
HISTSIZE=$SAVEHIST
HISTUP=erace
setopt appendhistory
setopt sharehistory
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_verify

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

export ANDROID_HOME="~/Library/Android/sdk"
export PATH="$ANDROID_HOME/build-tools/current:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

export STARSHIP_CONFIG="$HOME/.config/starship/init.toml"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK
export SDKMAN_DIR="~/.sdkman"
if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
