test -e "$HOME/.profile" && source "$HOME/.profile"

# ----------------------------------------------------------------------
# ZSH OPTIONS
# ----------------------------------------------------------------------

setopt CHASE_LINKS
setopt extendedglob
unsetopt share_history

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
