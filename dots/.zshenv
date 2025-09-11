# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# fff [https://github.com/dylanaraps/fff]
export FFF_HIDDEN=1
export FFF_LS_COLORS=1
export FFF_CD_ON_EXIT=0
export EDITOR="nvim"

# Starship [https://starship.rs]
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/init.toml"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
PATH="$PATH:$ANDROID_HOME/build-tools/current"
PATH="$PATH:$ANDROID_HOME/emulator"
PATH="$PATH:$ANDROID_HOME/platform-tools"

# Homebrew
export HOMEBREW_DEVELOPER=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_ANALYTICS_DEBUG=1