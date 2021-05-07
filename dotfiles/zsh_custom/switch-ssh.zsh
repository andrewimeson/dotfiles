# Makes the SSH connection to switches prettier using chromaterm
# https://github.com/hSaria/ChromaTerm

# This is a function instead of a shell script in $PATH because some external
# utilities execute the 'ssh' binary, and I've had bad experiences with wrapper
# scripts breaking those utilities in weird ways.

# in case we've been sourced again and we already defined the function below

# shellcheck disable=SC2034
if typeset -f ssh >/dev/null; then
    unset  -f ssh 
fi

SSH_BINARY=$(command -v ssh)

if command -v ct >/dev/null; then
  ssh() {
      # This is very niave.
      if [[ $* =~ ^[Ss][Ww](-[^-]) ]]; then
          echo "I think it's a switch" | lolcat
          ct "$SSH_BINARY" "$@"
      else
          "$SSH_BINARY" "$@"
      fi

  }
fi
