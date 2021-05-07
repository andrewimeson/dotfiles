# Dotfiles - Subdirectory

Most dotfiles work by being stored in the home directory with a standard
filename, but others can point to custom locations (at least for sub-config
files) or use the [XDG Base Directory Specification][1] to know where to drop
config files.

It's also helpful if you're an Oh-My-Zsh user to move your $ZSH_CUSTOM folder
out of the default location, as otherwise you will have fun trying to figure out
git-within-git (and submodules can't solve it either) for tracking your
dotfiles.

Rather than hardcoding `$HOME/dotfiles` in different places, please instead use
`$XDG_CONFIG_HOME`, which should point here (with no trailing space).


[1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
