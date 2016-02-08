_rc_test_shell_bin
_rc_test_shell_type

# -------------------------------------------------------------------
# FASD
# -------------------------------------------------------------------
eval "$(fasd --init auto)"

# -------------------------------------------------------------------
# COMMON
# -------------------------------------------------------------------
_rc_xset
# _rc_motd


# ----------------------------------------------------------------------
# OH-MY-ZSH
# ----------------------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=cypher

plugins=(osx bower brew brew-cask bundler chruby coffee cp docker extract fasd gem
         grunt heroku history mosh nmap npm postgres pow powder rails rake
         rsync ruby sublime sudo tmux vagrant xcode zsh_reload)

test -n "$ZSH" && source $ZSH/oh-my-zsh.sh


_rc_debug_print ZSHRC
