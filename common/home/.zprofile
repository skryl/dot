# DEBUG=1

test -e "$HOME/.functions" && source "$HOME/.functions"
test -e "$HOME/.aliases"   && source "$HOME/.aliases"

_rc_test_shell_bin
_rc_test_shell_type


# ----------------------------------------------------------------------
# OPTIONS
# ----------------------------------------------------------------------
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
: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOSTFILE=~/.ssh/known_hosts}
: ${INPUTRC=~/.inputrc}

export HOME=~
export TERM=xterm-256color
export TERMINAL=xterm-256color
export DROPBOX=$HOME/Dropbox
export DEV=$DROPBOX/dev

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
[ "$UNAME" = Darwin ] && OSX=1 || LINUX=1
HAVE_VIM=$(command -v vim)
HAVE_GVIM=$(command -v gvim)
HAVE_XSET=$(test -n "$DISPLAY" && test -z "$UNAME" && command -v xset)

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'


# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------
test -n "$HAVE_VIM" && EDITOR=vim || EDITOR=vi
export EDITOR

if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER


# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

if test -n "$OSX"; then
  BREW=/usr/local
  PATH="$BREW/bin:$BREW/sbin:$PATH"
  MANPATH="$BREW/share/man:$MANPATH"
fi

_rc_debug_print "PATH: $PATH"
_rc_path_append_check  "/usr/local/heroku/bin"
_rc_path_append_check  "/usr/local/share/npm/bin"
_rc_path_prepend_check "$HOME/bin"
_rc_path_prepend       "./bin"

# -------------------------------------------------------------------
# ECLIPSE
# -------------------------------------------------------------------
export ECLIPSE_HOME=/Applications/eclipse


# -------------------------------------------------------------------
# OPAM
# -------------------------------------------------------------------
test -d "/Users/skryl/.spam/opam-init" && . /Users/skryl/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
test -n "$(command -v opam)" && eval `opam config env`


# -------------------------------------------------------------------
# RUBY/RVM/RBENV
# -------------------------------------------------------------------
test -n "$(command -v rbenv)" && eval "$(rbenv init -)"


# -------------------------------------------------------------------
# JS/NODE/NVM
# -------------------------------------------------------------------
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# -------------------------------------------------------------------
# GO
# -------------------------------------------------------------------
export GOPATH=$HOME/.go
_rc_path_append_check "$GOPATH/bin"


# -------------------------------------------------------------------
# KEYCHAIN
# -------------------------------------------------------------------
if test -n "$LINUX"; then
  keychain --quiet id_rsa git_skryl

  KEYCHAIN_SCRIPT="$HOME/.keychain/$(hostname)-sh"
  if [ -f "$KEYCHAIN_SCRIPT" ]; then
      source $KEYCHAIN_SCRIPT
  fi
fi


# -------------------------------------------------------------------
# PYTHON
# -------------------------------------------------------------------
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
_rc_path_append_check "/usr/local/lib/python2.7/bin"


# -------------------------------------------------------------------
# EC2 / AWS
# -------------------------------------------------------------------
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_KEYS="$HOME/.aws/current.keys"

test -f "$AWS_HOME" && source "$AWS_HOME"
_rc_path_append_check "$EC2_HOME/bin"


# -------------------------------------------------------------------
# JAVA
# -------------------------------------------------------------------
if test -n $OSX; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
else
  export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
fi


# -------------------------------------------------------------------
# HASKELL/XMONAD
# -------------------------------------------------------------------
export USERWM=`which xmonad`


# -------------------------------------------------------------------
# SBT
# -------------------------------------------------------------------
export SBT_OPTS=-XX:MaxPermSize=512m


# -------------------------------------------------------------------
# ANDROID
# -------------------------------------------------------------------
_rc_path_append_check /Applications/Android\ Studio.app/sdk/tools
_rc_path_append_check /Applications/Android\ Studio.app/sdk/platform-tools
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1



# -------------------------------------------------------------------
# DOCKER
# -------------------------------------------------------------------
export DOCKER_CERT_PATH=/Users/skryl/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376


_rc_export_paths
_rc_debug_print "PATH: $PATH"
_rc_debug_print PROFILE
