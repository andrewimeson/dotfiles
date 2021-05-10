source ~/.profile # get cross-shell configuration

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# /usr/local/sbin needed for arping and mtr
# IMPROVE: Wow, you really could do a cleaner job setting $PATH
# One thing you might want to do is also switch to having it set in `.profile`
# instead.
export PATH="$HOME/Library/Python/3.7/bin:/usr/local/sbin:$PATH:$HOME/.composer/vendor/bin"

# And again, let's get Python 3.7 since Ansible 2.8 doesn't support 3.8
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
# Ruby!
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Use hyphen-insensitive completion. Case sensitive completion must be off.
# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Using oh-my-zsh as a git submodule, so update that way
DISABLE_AUTO_UPDATE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh_custom"

plugins=(
  aws
  colored-man-pages
  extract
  git
  pip
  sudo
  terraform
  vagrant
  zsh-autosuggestions
  zsh-completions
  zsh-prioritize-cwd-history
  zsh-syntax-highlighting
)

# ssh-agent plugin config must be before oh-my-zsh is loaded
zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# IMPROVE: Move to $ZSH_CUSTOM
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
