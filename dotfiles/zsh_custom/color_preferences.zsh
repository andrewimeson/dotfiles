# This could be better as an associative array (does zsh have those?) or a case
# statement, but this is practical
if [[ $ITERM_PROFILE == 'Solarized-Light' ]]; then
  export BAT_THEME='Solarized (light)'
# I don't actually have a dark theme right now
elif [[ $ITERM_PROFILE == 'Solarized-Dark' ]]; then
  export BAT_THEME='Solarized (dark)'
else
  export BAT_THEME='ansi'
fi

if [[ $OSTYPE =~ "darwin" ]]; then
  # For some reason, on macOS, this is the only way I get ls colors. I'm too
  # lazy to figure out why right now. So this.
  unset LSCOLORS
fi
