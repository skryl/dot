# test -e "$HOME/.profile" && source "$HOME/.profile"

_rc_debug_print ZSHRC
_rc_test_shell_bin
_rc_test_shell_type

# ----------------------------------------------------------------------
# OH-MY-ZSH
# ----------------------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=cypher

plugins=(extract osx)
test -n "$ZSH" && source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# FASD
# -------------------------------------------------------------------
eval "$(fasd --init auto)"

# -------------------------------------------------------------------
# COMMON
# -------------------------------------------------------------------
_rc_aliases
_rc_xset
# _rc_motd
