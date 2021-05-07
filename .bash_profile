# shellcheck shell=bash
source .profile # get cross-shell configuration

if [ -f "$HOME/.bashrc" ]; then
  # shellcheck source=.bashrc
  source "$HOME/.bashrc"
fi

# shellcheck disable=SC2034
if typeset -f ssh >/dev/null; then
  unset -f ssh
fi

# SSH to switches with cool syntax highlighting
SSH_BINARY=$(command -v ssh)

if command -v ct >/dev/null; then
  ssh() {
    # This is very niave.
    if [[ $* =~ ^[Ss][Ww](-[^-]) ]]; then
      echo "I think it's a switch" | lolcat
      ct "$SSH_BINARY" "$@"
    else
      $SSH_BINARY "$@"
    fi

  }
fi
