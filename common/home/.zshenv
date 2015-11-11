test -e "$HOME/.profile" && source "$HOME/.profile"

# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------
fpath=($HOME/.zsh-completions $fpath)


# ----------------------------------------------------------------------
# ZSH OPTIONS
# ----------------------------------------------------------------------

setopt CHASE_LINKS
setopt extendedglob
unsetopt share_history

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
