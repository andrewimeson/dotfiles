if [[ $OSTYPE =~ "darwin" ]]; then
    # For some reason, on macOS, this is the only way I get ls colors. I'm too
    # lazy to figure out why right now. So this.
    unset LSCOLORS
fi

