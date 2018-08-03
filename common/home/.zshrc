# -------------------------------------------------------------------
# COMMON
# -------------------------------------------------------------------
_rc_xset
# _rc_motd
export KEYTIMEOUT=1


# ----------------------------------------------------------------------
# ANTIGEN
# ----------------------------------------------------------------------
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle adb
#antigen bundle bundler
#antigen bundle colored-man-pages
#antigen bundle command-not-found
#antigen bundle common-aliases
#antigen bundle docker
#antigen bundle docker-compose
#antigen bundle gem
#antigen bundle heroku
#antigen bundle nmap
#antigen bundle osx
#antigen bundle perms
#antigen bundle pip
#antigen bundle rails
#antigen bundle rake
#antigen bundle rbenv
antigen bundle sudo
#antigen bundle tmux

# External plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

# Load theme.
#antigen theme cypher
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# Settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# ----------------------------------------------------------------------
# FZF
# ----------------------------------------------------------------------

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

source "/usr/local/opt/fzf/shell/key-bindings.zsh"


_rc_debug_print "PATH: $PATH"
_rc_debug_print ZSHRC
