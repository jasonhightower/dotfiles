VIM="nvim"

source $ZDOTDIR/aliases.sh
source $ZDOTDIR/completion.zsh


# TODO JH thinkg about bringing this back 
# fpath=($ZDOTDIR/prompt $fpath)
# source  $ZDOTDIR/prompt/prompt_purification_setup
# autoload -Uz prompt_purification_setup && prompt_purification_setup

bindkey -s ^f "~/.local/scripts/tmux-sessionizer\n"

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# cargo
source "$HOME/.cargo/env"
