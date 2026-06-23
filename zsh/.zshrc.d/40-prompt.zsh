# Prompt — Starship (you already use it; was incorrectly on bash before)

if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  # Minimal fallback
  autoload -Uz promptinit
  promptinit
  prompt adam2
fi