# DEBUG=1

test -e "$HOME/.functions" && source "$HOME/.functions"

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
_rc_path_prepend_check "/usr/local/opt/postgresql@9.6/bin"
_rc_path_prepend_check "/usr/local/opt/llvm@4/bin"
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

# NODE/NODENV
# -------------------------------------------------------------------
test -n "$(command -v nodenv)" && eval "$(nodenv init -)"


# -------------------------------------------------------------------
# ASDF (Universal Version Manager)
# -------------------------------------------------------------------
#test -d "$HOME/.asdf" && source $HOME/.asdf/asdf.sh
#test -d "$HOME/.asdf" && source $HOME/.asdf/completions/asdf.bash


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
unset PYTHONPATH
export PYENV_ROOT="$HOME/.pyenv"
test -n "$(command -v pyenv)" && eval "$(pyenv init -)"
_rc_path_append_check "$PYENV_ROOT/bin"


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
export IDEA_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk

# -------------------------------------------------------------------
# DRONECI
# -------------------------------------------------------------------
export DRONE_SERVER=http://ci.usetrusted.com
export DRONE_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0Ijoic2tyeWwiLCJ0eXBlIjoidXNlciJ9.1D9dxHzPHrItwlx39VIh8c6SqoOTs0ULFCjVrsHBYvo


# -------------------------------------------------------------------
# GITHUB
# -------------------------------------------------------------------
export GITHUB_USER=skryl
export GITHUB_TOKEN=manager


# -------------------------------------------------------------------
# BUGSNAG
# -------------------------------------------------------------------
export BUGSNAG_TOKEN=5b247282bbbeacbea3e91a6acd186f74
export BUGSNAG_PROJECT=backend


# -------------------------------------------------------------------
# RUST
# -------------------------------------------------------------------
_rc_path_append "$HOME/.cargo/bin"
export XDG_RUNTIME_DIR="/tmp"

# -------------------------------------------------------------------
# FASD
# -------------------------------------------------------------------
eval "$(fasd --init auto)"



_rc_export_paths
_rc_debug_print "PATH: $PATH"
_rc_debug_print PROFILE

test -e "$HOME/.aliases"   && source "$HOME/.aliases"

export PATH="$HOME/.cargo/bin:$PATH"
