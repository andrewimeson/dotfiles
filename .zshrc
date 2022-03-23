source ~/.profile # get cross-shell configuration

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# /usr/local/sbin needed for arping and mtr
export PATH="$PATH:/usr/local/sbin"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
# SonarQube sonar-scanner, manually installed via coping into directory
export PATH="/opt/sonar-scanner/bin:$PATH"
# Poetry for Python dependency management
export PATH="$PATH:$HOME/.poetry/bin"
# pipx for installing and running Python programs in a more isolated fashion
# than pip
export PATH="$PATH:$HOME/.local/bin"

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
