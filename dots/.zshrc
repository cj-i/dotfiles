export BREW_HOME="/opt/homebrew"
PATH="$BREW_HOME/bin:$PATH"
if [[ -f "$BREW_HOME/bin/brew" ]] then
  eval "$($BREW_HOME/bin/brew shellenv)"
fi

if [[ ":$FPATH:" != *":$XDG_CACHE_HOME/zsh/completions:"* ]]; then
  export FPATH="$XDG_CACHE_HOME/zsh/completions:$FPATH"
fi

alias b='bat'
alias e-zsh="nvim $ZDOTDIR/.zshrc"
alias f='fff'
alias fman='comgen -c | fzf | xargs man'
alias fk='sudo !!'
alias fz='nvim $(fzf --preview="bat --color=always {}")'
alias h-sh='$SHELL --help'
alias ls='ls -lah --color'
alias p="ps aux | grep $1"
alias pr="ps aux | rg $1"
alias r-nix='home-manager switch --flake ~/.config/nix#me-nix'
alias r-sh='exec $SHELL -l'
alias set-o='set -o' # list of setopt
alias y='yazi'
alias zle-al='zle -al' # list of bindings

source $BREW_HOME/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $BREW_HOME/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_HOME/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zmodload zsh/curses
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U tetris

# disable commands underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

setopt append_history inc_append_history sharehistory
setopt auto_menu
setopt menu_complete
setopt autocd
setopt auto_param_slash
setopt no_case_glob
setopt no_case_match
setopt globdots
setopt extended_glob
setopt interactive_comments
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify
SAVEHIST=10000
HISTSIZE=10000
HISTUP=erace
HISTCONTROL=ignoreboth
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
# zstyle ':completion:*' squeeze-slashes false
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/init.toml"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
