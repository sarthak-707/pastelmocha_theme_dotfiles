# Completion system — fast, fuzzy-friendly, menu-driven

zmodload zsh/complist

autoload -Uz compinit bashcompinit
bashcompinit 2>/dev/null

# Rebuild completion cache at most once per day
local zcomp="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -n ${zcomp}(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# fzf-tab: fuzzy picker for Tab completion (replaces plain menu)
if [[ -d ${ZDOTDIR:-$HOME}/.local/share/zsh/plugins/fzf-tab ]]; then
  source "${ZDOTDIR:-$HOME}/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
  zstyle ':fzf-tab:complete:*' fzf-flags '--height=50% --layout=reverse --border=rounded --color=fg:-1,bg:-1,hl:#5f87af,fg+:#ffffff,bg+:#262626,hl+:#5fd7ff'
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -lah --color=always $realpath 2>/dev/null | head -40'
  zstyle ':fzf-tab:complete:git-*:*' fzf-preview 'git log --oneline -5 $word 2>/dev/null'
  zstyle ':fzf-tab:complete:dnf*:*' fzf-preview 'rpm -qi $word 2>/dev/null | head -20'
fi

# Behavior
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}No matches%f'
zstyle ':completion:*:messages' format '%F{yellow}%d%f'
zstyle ':completion:*:corrections' format '%F{magenta}%d%f'

# Case-insensitive + partial word matching
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|=*' 'l:|=* r:|=*' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Directories first in file completion
zstyle ':completion:*' file-sort 'size (-)'

# sudo / doas — complete the real command
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*' ignore-parents parent pwd

# Kill menu — show process names
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'

# Git — show dirty status in descriptions when available
zstyle ':completion:*:*:git*:*' sort false

# dnf5
[[ -f /usr/share/zsh/site-functions/_dnf5 ]] && autoload -Uz _dnf5