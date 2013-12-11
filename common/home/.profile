test -e "$HOME/.bash_functions" && source "$HOME/.bash_functions"

_rc_test_shell_bin
_rc_test_shell_type

# ----------------------------------------------------------------------
# OPTIONS
# ----------------------------------------------------------------------
_rc_debug_print OPTS

# notify of bg job completion immediately
set -o notify

# vi mode
# set -o vi

# see bash(1) for details
shopt -s cdspell >/dev/null 2>&1
shopt -s extglob >/dev/null 2>&1
shopt -s histappend >/dev/null 2>&1
shopt -s hostcomplete >/dev/null 2>&1
shopt -s interactive_comments >/dev/null 2>&1
shopt -u mailwarn >/dev/null 2>&1
shopt -s no_empty_cmd_completion >/dev/null 2>&1

# default umask
umask 0022


# ----------------------------------------------------------------------
# ENVIRONMENT
# ----------------------------------------------------------------------
_rc_debug_print ENV

: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOSTFILE=~/.ssh/known_hosts}
: ${INPUTRC=~/.inputrc}

export HOME=~
export TERM=xterm-256color
export DROPBOX=$HOME/Dropbox

# enable en_US locale w/ utf-8 encodings if not already configured
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# always use PASSIVE mode ftp
: ${FTP_PASSIVE:=1}
export FTP_PASSIVE

# See what we have to work with ...
HAVE_VIM=$(command -v vim)
HAVE_GVIM=$(command -v gvim)
HAVE_XSET=$(test -n "$DISPLAY" && test -z "$UNAME" && command -v xset)


# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------
_rc_debug_print PATH

# we want the various sbins on the path along with /usr/local/bin
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"


# ----------------------------------------------------------------------
# PACKAGES
# ----------------------------------------------------------------------
_rc_debug_print PACKAGES

if [ "$UNAME" = Darwin ]; then

  # add macports path
  # test -x /opt/local && {
  #     PORTS=/opt/local
  #     # setup the PATH and MANPATH
  #     PATH="$PORTS/bin:$PORTS/sbin:$PATH"
  #     MANPATH="$PORTS/share/man:$MANPATH"
  # }

  # add homebrew path
  test -x /usr/local && {
      BREW=/usr/local
      # setup the PATH and MANPATH
      PATH="$BREW/bin:$BREW/sbin:$PATH"
      MANPATH="$BREW/share/man:$MANPATH"
  }

fi


# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------
_rc_debug_print EDITOR

# EDITOR
test -n "$HAVE_VIM" && EDITOR=vim || EDITOR=vi
export EDITOR

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER


# -------------------------------------------------------------------
# ECLIPSE
# -------------------------------------------------------------------
export ECLIPSE_HOME=/Applications/eclipse 

# -------------------------------------------------------------------
# RUBY/RVM/RBENV
# -------------------------------------------------------------------
_rc_debug_print RUBY

test -n "$(command -v rbenv)" && eval "$(rbenv init -)"


# -------------------------------------------------------------------
# OPAM
# -------------------------------------------------------------------
_rc_debug_print OPAM

test -d "/Users/skryl/.spam/opam-init" && . /Users/skryl/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
test -n "$(command -v opam)" && eval `opam config env`
 
# -------------------------------------------------------------------
# GO
# -------------------------------------------------------------------
_rc_debug_print GO

export GOPATH=$HOME/.go
test -d "$GOPATH/bin" && PATH=$PATH:$GOPATH/bin

 #-------------------------------------------------------------------
# HEROKU
# -------------------------------------------------------------------
_rc_debug_print HEROKU

test -d "/usr/local/heroku/bin" && PATH="/usr/local/heroku/bin:$PATH"


# -------------------------------------------------------------------
# KEYCHAIN
# -------------------------------------------------------------------
_rc_debug_print KEYCHAIN

KEYCHAIN_SCRIPT="$HOME/.keychain/$(hostname)-sh"
if [ -f "$KEYCHAIN_SCRIPT" ]; then
    source $KEYCHAIN_SCRIPT
fi


# -------------------------------------------------------------------
# PYTHON
# -------------------------------------------------------------------
_rc_debug_print PYTHON

PYTHONBIN=/usr/local/lib/python2.7/bin
PYTHONPATH=/usr/local/lib/python2.7/site-packages
test -d $PYTHONBIN && PATH=$PATH:$PYTHONBIN
test -d "$PYTHONPATH" && export PYTHONPATH


# -------------------------------------------------------------------
# EC2 / AWS
# -------------------------------------------------------------------
_rc_debug_print AWS

export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
source $HOME/.aws/current.keys
PATH=$PATH:$EC2_HOME/bin

if [ "$UNAME" = Darwin ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
else
  export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
fi

# -------------------------------------------------------------------
# NODE
# -------------------------------------------------------------------
_rc_debug_print NODE

PATH=$PATH:/usr/local/share/npm/bin

# -------------------------------------------------------------------
# XMONAD
# -------------------------------------------------------------------
_rc_debug_print XMONAD

test -d "$HOME/.cabal/bin" && PATH="$HOME/.cabal/bin:$PATH"

export USERWM=`which xmonad`

# -------------------------------------------------------------------
# I3 
# -------------------------------------------------------------------
_rc_debug_print I3 

export TERMINAL=xterm-256color


# -------------------------------------------------------------------
# AVR-GCC
# -------------------------------------------------------------------
_rc_debug_print AVR

# -------------------------------------------------------------------
# SBT
# -------------------------------------------------------------------
_rc_debug_print SBT

export SBT_OPTS=-XX:MaxPermSize=512m

# -------------------------------------------------------------------
# HOME
# -------------------------------------------------------------------
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# -------------------------------------------------------------------
# AVR
# -------------------------------------------------------------------
test -d "/usr/local/CrossPack-AVR" && PATH="/usr/local/CrossPack-AVR/bin:$PATH"


_rc_export_paths
