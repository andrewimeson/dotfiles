My configuration files for macOS, FreeBSD, and Linux. The `dots` method of
tracking dotfiles came from [jaagr/dots](https://github.com/jaagr/dots).

Rather than using the built in update mechanisms in oh-my-zsh and other tools, I
use git submodules. This lets me keep the versions consistent between systems,
and I don't have to use different update methodologies for different tools.

I use `git-crypt` and my GPG key to unlock secret files.

#### Alias
The following alias will be present once you clone the repo, but you can also
paste it into your shell session for the setup process.

```sh
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
```

#### Setup

```sh
git init --bare $HOME/.dots.git --initial-branch=master
dots remote add origin git@github.com:andrewimeson/dotfiles.git
# If GPG is setup, verify commit signatures
dots pull origin master --verify-signatures
dots submodule update --init --recursive
dots crypt unlock
```

#### Configuration

To get sane status, you may want to adjust the following for the dots
repository.

```sh
dots config status.showUntrackedFiles no
# Useful aliases
dots config alias.untracked "status -u ."
dots config alias.untracked-at "status -u"
```

#### Usage

```sh
# Use the dots alias like you would use the git command
dots status
dots add --update ...
dots commit -m "..."
dots push

# Listing files (not tracked by git)
dots untracked
dots status -u .config/

# Listing files (tracked by git)
dots ls-files
dots ls-files .config/polybar/
```

To get a list of files not tracked by git, use `dots untracked` or
`dots untracked-at $HOME/path/to/foo/bar` to only show files in a specific
subdirectory.
