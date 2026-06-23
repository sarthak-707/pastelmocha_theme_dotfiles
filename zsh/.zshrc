# ~/.zshrc — interactive Zsh configuration
# Modular snippets live in ~/.zshrc.d/*.zsh (sorted by name)

# Login / system profile for non-login interactive shells (Fedora)
[[ -r /etc/zshrc ]] && source /etc/zshrc

# Optional per-user env (export-only; keep non-interactive stuff here)
[[ -r "$HOME/.zshenv" ]] && source "$HOME/.zshenv"

# Load fragments
if [[ -d ${ZDOTDIR:-$HOME}/.zshrc.d ]]; then
  for _zsh_fragment in ${ZDOTDIR:-$HOME}/.zshrc.d/*.zsh(N); do
    source "$_zsh_fragment"
  done
  unset _zsh_fragment
fi

# Local overrides (machine-specific, not synced)
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"