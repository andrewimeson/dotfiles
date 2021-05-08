# shellcheck shell=sh
# .profile should be sourced by all shells. If they don't by default source it,
# they should be told to source it. Make sure this file only uses POSIX
# features, and only ones that you believe to be supported by non-POSIX
# compliant shells like ZSH. In other words, KISS

XDG_CONFIG_HOME="$HOME/dotfiles"
export XDG_CONFIG_HOME

if [ -f ~/.profile.local ]; then
  # shellcheck disable=SC1090
  . ~/.profile.local
fi
