# Aliases & small functions

# ls — use eza if installed, else GNU ls with color
if command -v eza &>/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza --tree --level=2 --icons'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
  alias la='ls -A --color=auto'
fi

# cat — bat if available
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
  export MANPAGER="sh -c 'col -bx | bat -l log -p'"
fi

alias ..='cd ..'
alias ...='cd ../..'
alias md='mkdir -p'

# Git shortcuts
alias g='git'
alias gs='git status -sb'
alias gd='git diff'
alias gco='git checkout'
alias gp='git pull --rebase'

# Hermes / Hindsight (from your bashrc)
alias hindsight-ui='/home/sarthak/.hermes/hermes-agent/venv/bin/hindsight-embed -p hermes ui start'
alias hindsight-ui-stop='/home/sarthak/.hermes/hermes-agent/venv/bin/hindsight-embed -p hermes ui stop'

# Quick edit this config
alias zshrc='$EDITOR ${ZDOTDIR:-$HOME}/.zshrc'
alias zshreload='source ${ZDOTDIR:-$HOME}/.zshrc'

# Safety nets
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'

# fd as a friendlier find (if installed)
command -v fd &>/dev/null && alias find=fd