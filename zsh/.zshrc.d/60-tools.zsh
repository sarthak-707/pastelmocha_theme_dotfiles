# Language runtimes & CLI tool hooks

# Rust
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Node (nvm) — lazy-friendly full load
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
  [[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"
fi

# fzf — key bindings + completion
if command -v fzf &>/dev/null; then
  source /usr/share/fzf/shell/completion.zsh 2>/dev/null || true
  source /usr/share/fzf/shell/key-bindings.zsh 2>/dev/null || true
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=fg:-1,bg:-1,hl:#5f87af,fg+:#ffffff,bg+:#262626,hl+:#5fd7ff'
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null || find . -type f'
fi

# zoxide — smarter cd (install: dnf install zoxide)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# OpenClaw completions (bash path from old config; add zsh if you install it)
[[ -f "$HOME/.openclaw/completions/openclaw.zsh" ]] && source "$HOME/.openclaw/completions/openclaw.zsh"
[[ -f "$HOME/.openclaw/completions/openclaw.bash" ]] && source "$HOME/.openclaw/completions/openclaw.bash"