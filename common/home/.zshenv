# -------------------------------------------------------------------
# RUBY/RVM/RBENV
# -------------------------------------------------------------------

test -n $(command -v rbenv) && eval "$(rbenv init -)"

# ----------------------------------------------------------------------
# PACKAGES
# ----------------------------------------------------------------------
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
