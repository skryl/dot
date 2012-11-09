#!/usr/bin/env zsh

# DEBUG=true

# ----------------------------------------------------------------------
# SHELL VARS
# ----------------------------------------------------------------------
test -n "$DEBUG" && echo SHELL_VARS

: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOSTFILE=~/.ssh/known_hosts}
: ${INPUTRC=~/.inputrc}

export HOME=~
export TERM=xterm-256color
export DROPBOX=$HOME/Dropbox
export SKULLCANDY=/Volumes/skullcandy
export GTECH=/Volumes/gtech

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=cypher

plugins=(osx vi-mode)
test -n "$ZSH" && source $ZSH/oh-my-zsh.sh

#  SHELL OPTIONS
# ----------------------------------------------------------------------
test -n "$DEBUG" && echo SHELL

# notify of bg job completion immediately
set -o notify

# vi mode
#set -o vi

# see bash(1) for details
shopt -s cdspell >/dev/null 2>&1
shopt -s extglob >/dev/null 2>&1
shopt -s histappend >/dev/null 2>&1
shopt -s hostcomplete >/dev/null 2>&1
shopt -s interactive_comments >/dev/null 2>&1
shopt -u mailwarn >/dev/null 2>&1
shopt -s no_empty_cmd_completion >/dev/null 2>&1
setopt CHASE_LINKS
setopt extendedglob
unsetopt share_history

# disable core dumps
ulimit -S -c 0

# default umask
umask 0022

# rebind keys
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------
test -n "$DEBUG" && echo ENV

# detect interactive shell
case "$-" in
    *i*) INTERACTIVE=1 ;;
    *)   unset INTERACTIVE ;;
esac

# detect login shell
case "$0" in
    -*) LOGIN=1 ;;
    *)  unset LOGIN ;;
esac

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

# load aliases
[ -e "$HOME/.aliases" ] && source "$HOME/.aliases"

# set keyboard rate
test -n "$HAVE_XSET" && set r rate 250 50

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------
test -n "$DEBUG" && echo PATH

# we want the various sbins on the path along with /usr/local/bin
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

# ~/bin
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# ----------------------------------------------------------------------
# PACKAGES
# ----------------------------------------------------------------------
test -n "$DEBUG" && echo PACKAGES

if [ "$UNAME" = Darwin ]; then

  # add macports path
  # test -x /opt/local && {
  #     PORTS=/opt/local
  #     # setup the PATH and MANPATH
  #     PATH="$PORTS/bin:$PORTS/sbin:$PATH"
  #     MANPATH="$PORTS/share/man:$MANPATH"
  #     # DYLD_LIBRARY_PATH="/opt/local/lib"
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
test -n "$DEBUG" && echo EDITOR

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
# MOTD / FORTUNE
# -------------------------------------------------------------------
test -n "$DEBUG" && echo MOTD

test -n "$INTERACTIVE" -a -n "$LOGIN" && {
    uname -npsr
    uptime
}

# -------------------------------------------------------------------
# KEYCHAIN
# -------------------------------------------------------------------
test -n "$DEBUG" && echo KEYCHAIN

KEYCHAIN_SCRIPT="$HOME/.keychain/$(hostname)-sh"
if [ -f "$KEYCHAIN_SCRIPT" ]; then
    source $KEYCHAIN_SCRIPT
fi

# -------------------------------------------------------------------
# RUBY/RVM/RBENV
# -------------------------------------------------------------------
# test -n "$DEBUG" && echo RUBY

#  if [[ -s $HOME/.rvm/scripts/rvm ]] ; then 
#    source $HOME/.rvm/scripts/rvm ; 
#    # rerun all the rvm scripts to fix the PATH after messing with it
#    rvm reload
#  fi

test -n $(command -v rbenv) && eval "$(rbenv init -)"
 
# -------------------------------------------------------------------
# PYTHON
# -------------------------------------------------------------------

export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

# -------------------------------------------------------------------
# EC2 / AWS
# -------------------------------------------------------------------
test -n "$DEBUG" && echo AWS

 export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
 source $HOME/.aws/current.keys
 PATH=$PATH:$EC2_HOME/bin

 if [ "$UNAME" = Darwin ]; then
   export JAVA_HOME="$(/usr/libexec/java_home)"
 else
   export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
 fi

# -------------------------------------------------------------------
# XMONAD
# -------------------------------------------------------------------
test -n "$DEBUG" && echo XMONAD

  test -d "$HOME/.cabal/bin" && PATH="$HOME/.cabal/bin:$PATH"

  #Xmonad
  export USERWM=`which xmonad`

# -------------------------------------------------------------------
# AVR-GCC
# -------------------------------------------------------------------
test -n "$DEBUG" && echo AVR

  test -d "/usr/local/CrossPack-AVR" && PATH="/usr/local/CrossPack-AVR/bin:$PATH"

# -------------------------------------------------------------------
# FASD
# -------------------------------------------------------------------
test -n "$DEBUG" && echo FASD

  eval "$(fasd --init posix-alias zsh-hook)"


# -------------------------------------------------------------------
# HEROKU
# -------------------------------------------------------------------
test -n "$DEBUG" && echo HEROKU

  PATH="/usr/local/heroku/bin:$PATH"


# -------------------------------------------------------------------
# VIM (fixes rvm path clobbering)
# -------------------------------------------------------------------
# test -n "$DEBUG" && echo VIM
#   vim()
#   {
#     (unset GEM_PATH GEM_HOME; command vim "$@")
#   }


export PATH MANPATH
