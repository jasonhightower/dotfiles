source $XDG_CONFIG_HOME/aliases.sh
source $ZDOTDIR/completion.zsh

# prompt
fpath=($ZDOTDIR/prompt $fpath)
source  $ZDOTDIR/prompt/prompt_purification_setup
# autoload -Uz prompt_purification_setup && prompt_purification_setup

# cargo
source "$HOME/.cargo/env"
