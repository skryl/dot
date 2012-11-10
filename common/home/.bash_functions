#!/bin/bash

function _rc_test_shell_type {
  # detect interactive shell
  case "$-" in
      *i*) INTERACTIVE=1 ;;
      *)   unset INTERACTIVE ;;
  esac

  # # detect login shell
  case "$0" in
      -*) LOGIN=1 ;;
      *)  unset LOGIN ;;
  esac
}


function _rc_test_shell_bin {
  if [ -n "$ZSH_VERSION" ]; then
     ZSH=1
  elif [ -n "$BASH_VERSION" ]; then
     BASH=1
  fi
}


function _rc_motd {
  test -n "$INTERACTIVE" && {
    uname -npsr
    uptime
  }
}


function _rc_debug_print {
  test -n "$DEBUG" && test "$INTERACTIVE" && echo $1
}


function _rc_export_paths {
  export PATH MANPATH
}

function _rc_aliases {
  test -e "$HOME/.aliases" && source "$HOME/.aliases"
}

function _rc_xset {
  test -n "$HAVE_XSET" && set r rate 250 50
}
