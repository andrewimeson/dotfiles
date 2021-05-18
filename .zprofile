# Homebrew completion, which must be before oh-my-zsh is loaded, hence this file

# Disable zsh checking for directory permissions that allow group write, and
# refusing to load completion commands from there. On a Mac that group is
# "Admins", which means that any other user in that group could already do
# root-level mischief. Plus, to some extent, the threat model on the desktop is
# mostly code being executed as the current user. Of course, dotfiles may be
# cloned to a shared shell server, but I trust that I won't be pointing my sell
# completion directory to somewhere where an untrustworthy user can write.
ZSH_DISABLE_COMPFIX=true

the_brew() {
    if [[ -x /opt/homebrew/bin/brew ]]; then
        echo /opt/homebrew/bin/brew
    elif [[ -x /usr/local/bin/brew  ]]; then
        echo /usr/local/bin/brew
    fi
}
FPATH=$($(the_brew) --prefix)/share/zsh/site-functions:$FPATH

unset -f the_brew
