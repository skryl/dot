#!/bin/bash

# test -e "$HOME/.zprofile" && source "$HOME/.zprofile"
test -e "$HOME/.functions" && source "$HOME/.functions"
test -e "$HOME/.aliases"   && source "$HOME/.aliases"

_rc_test_shell_bin
_rc_test_shell_type

# ----------------------------------------------------------------------
# COMMON
# ----------------------------------------------------------------------
_rc_xset
# _rc_motd


# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------
_rc_setup_prompt_colors
_rc_setup_dircolors
_rc_setup_completion
test -n "$PS1" && _rc_set_prompt_color

# override and disable tilde expansion
_expand() {
  return 0
}

_rc_debug_print BASHRC
