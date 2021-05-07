# Makes word jumping work
# From https://coderwall.com/p/a8uxma/zsh-iterm2-osx-shortcuts
# make these the shortcuts:
#  ⌥ + ← / → 
#  ⌘ + ← / →
if [[ $OSTYPE =~ "darwin" ]] && [[ $TERM_PROGRAM = "iTerm.app" ]]; then
    # Err, not working skipping
    return 0
# These are skipped for now
# Part of it is I already use  ⌘ + ← / → to navigate between panes
    bindkey "[D" backward-word
    bindkey "[C" forward-word
    bindkey "^[a" beginning-of-line
    bindkey "^[e" end-of-line
fi
