# DEBUG=true

test -e "$HOME/.profile" && source "$HOME/.profile"

_rc_test_shell_bin
_rc_test_shell_type


# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------
_rc_debug_print PROMPT

export TERM=xterm-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;34m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"
YELLOW_GREY="\[\e[33;40m\]"
WHITE_BLACK="\[\e[0m\]"

if [ "$LOGNAME" = "root" ]; then
    COLOR1="${RED}"
    COLOR2="${BROWN}"
    P="#"
elif hostname | grep -q 'github\.com'; then
    GITHUB=yep
    COLOR1="\[\e[0;94m\]"
    COLOR2="\[\e[0;92m\]"
    P="\$"
else
    COLOR1="${BLUE}"
    COLOR2="${BROWN}"
    P="\$"
fi

prompt_simple() {
    unset PROMPT_COMMAND
    PS1="[\u@\h:\w]\$ "
    PS2="> "
}

prompt_compact() {
    unset PROMPT_COMMAND
    PS1="${COLOR1}${P}${PS_CLEAR} "
    PS2="> "
}

prompt_color() {
    PS1="${GREY}[${COLOR1}\u${GREY}@${COLOR2}\h${GREY}:${COLOR1}\W${GREY}]${COLOR2}$P${PS_CLEAR} "
    PS2="\[[33;1m\]continue \[[0m[1m\]> "
}

# Use the color prompt by default when interactive
test -n "$PS1" && prompt_color


# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------
_rc_debug_print COMPLETION

if test -z "$BASH_COMPLETION" ; then
  bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
  if [ "$PS1" ] && [ $bmajor -gt 1 ] ; then
    # search for a bash_completion file to source
    for f in /usr/pkg/etc/back_completion \
      /usr/local/etc/bash_completion \
      /opt/local/etc/bash_completion \
      /etc/bash_completion \
      ~/.bash_completion ;
    do
      test -f $f && {
        . $f
        break
      }
    done
  fi
  unset bash bmajor bminor
fi

# override and disable tilde expansion
_expand() {
  return 0
}


# ----------------------------------------------------------------------
# LS AND DIRCOLORS
# ----------------------------------------------------------------------
_rc_debug_print DIRCOLORS

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
  COLORS=/etc/DIR_COLORS
  test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
  test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
  test ! -e "$COLORS"               && COLORS=
  eval `$dircolors --sh $COLORS`
}
unset dircolors

# ----------------------------------------------------------------------
# COMMON
# ----------------------------------------------------------------------
_rc_debug_print COMMON

_rc_aliases
_rc_xset
_rc_motd
