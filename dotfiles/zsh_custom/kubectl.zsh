# Taken from oh-my-zsh plugin, but I didn't want all the aliases
if (( $+commands[kubectl] )); then
  # If the completion file does not exist, generate it and then source it
  # Otherwise, source it and regenerate in the background
    if [[ ! -f "$ZSH_CACHE_DIR/completions/_kubectl" ]]; then
        kubectl completion zsh | tee "$ZSH_CACHE_DIR/completions/_kubectl" >/dev/null
        source "$ZSH_CACHE_DIR/completions/_kubectl"
    else
        source "$ZSH_CACHE_DIR/completions/_kubectl"
        kubectl completion zsh | tee "$ZSH_CACHE_DIR/completions/_kubectl" >/dev/null &|
  fi
fi
