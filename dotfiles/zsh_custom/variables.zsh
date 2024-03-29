# Helpful variables for interactive stuff

# CleanBrowsing filtering
cbFamFilter=185.228.168.168
cbAdultFilter=185.228.168.10

chromeUserAgentMac='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36'
# Workaround for https://github.com/containers/podman/issues/13889
export DOCKER_BUILDKIT=0
# Set Podman as the Docker daemon
export DOCKER_HOST="unix://$HOME/.local/share/containers/podman/machine/podman-machine-default/podman.sock"
# Gitea CLI command completion
if command -v tea > /dev/null; then
    PROG=tea _CLI_ZSH_AUTOCOMPLETE_HACK=1 source "$HOME/dotfiles/tea/autocomplete.zsh"
fi
