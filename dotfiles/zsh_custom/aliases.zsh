alias powershell='pwsh'
alias dot="dots"
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
# Aliases for typos I make.
alias shh='echo "🤫"; sleep 0.2; ssh'
kk() {
    {
        echo "lol u suck at typing"
        ll "$@"
    } | lolcat
}

# Installed from `brew install vimpager`
alias vcat='vimcat'
#export PAGER=vimpager
export PAGER='less'

recompile-ycmd() {
    local opts=(
        --go-completer
        --ts-completer
    )
    # Subshell to avoid changing directory in parent shell
    (cd ~/.vim/bundle/YouCompleteMe &&
        ./install.py "${opts[@]}")
}

# IMPROVE: rewrite this as one or more functions
# would be cool to be able to go
# is_macos && stuff
#
# Probably categorize a bunch of different ways
# OS: is_macos is_linux is_freebsd
# Userland suites: is_bsd is_gnu
if [[ $OSTYPE =~ "darwin" ]]; then
    flushdns() {
        sudo killall -HUP mDNSResponder
        sudo killall mDNSResponderHelper
        sudo dscacheutil -flushcache
    }
    tftp-start() {
        echo "running the launchctl command to start tftp server"
        sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist && echo "bacon"
        sudo launchctl start com.apple.tftpd || echo fail
        echo "directory is:"
        echo "/private/tftpboot"
    }
    tftp-stop() {
        sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist
        sudo launchctl stop com.apple.tftpd && echo "k, worked, bai"
    }
    restart-usb() {
        sudo launchctl stop com.apple.usbd
        sudo launchctl start com.apple.usbd
    }
    # TODO: This isn't an alias
    # Should this actually do architecture detection, since _under Rosetta_ there
    # might be both installed? idk
    if [[ -x /opt/homebrew/bin/brew ]]; then
        # ARM64 Homebrew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        # x86_64 Homebrew
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    # "sudoedit" isn't present on macOS, but the oh-my-zsh 'sudo' plugins tries to
    # be clever by substituting "$EDITOR/vim $file" with "sudoedit,"
    command -v sudoedit || alias sudoedit='sudo --edit'
fi
# cansible - c[at]ansible. An easy way to view all the files in an Ansible role
# Created with @cstobey
alias cansible="find . -type f -name '*.yml' | grep -v ^./templates/ | sort | xargs tail -n +1"
# Requires the "git root" alias from my .gitconfig
groot() {
    if groot_root="$(git root)"; then
        # shellcheck disable=SC2164
        cd "$groot_root"
    else
        return 1
    fi
}

# Markdown rendering
alias grip="grip --browser"

dothevenvstuff() {
    if [[ -n $VIRTUAL_ENV ]]; then
        deactivate
        rehash
    fi
    if [[ ! -d ./.venv ]]; then
        echo "Creating venv"
        python3 -m venv .venv
    fi
    . ./.venv/bin/activate && echo "Activated venv"
    rehash # IMPROVE: Do we need this one, or just the one after?
    # IMPROVE: Handle not having any requirements files
    for file in requirements*.txt; do
        echo "Found requirements: $file"
        pip3 install -r $file
    done
    rehash
}

# Makes the SSH connection to switches prettier using chromaterm
# https://github.com/hSaria/ChromaTerm

# This is a function instead of a shell script in $PATH because some external
# utilities execute the 'ssh' binary, and I've had bad experiences with wrapper
# scripts breaking those utilities in weird ways.

# in case we've been sourced again and we already defined the function below

# shellcheck disable=SC2034
if typeset -f ssh > /dev/null; then
    unset -f ssh
fi

SSH_BINARY=$(command -v ssh)

if command -v ct > /dev/null; then
    ssh() {
        # This is very naive.
        if [[ $* =~ ^[Ss][Ww](-[^-]) ]]; then
            echo "I think it's a switch" | lolcat
            ct "$SSH_BINARY" "$@"
        else
            "$SSH_BINARY" "$@"
        fi

    }
fi
