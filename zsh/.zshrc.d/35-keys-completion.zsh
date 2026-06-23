# Tab / completion keys

# Menu navigation when using classic comp menu (fzf-tab uses fzf instead)
bindkey '^[[Z' reverse-menu-complete   # Shift+Tab
bindkey '^I' expand-or-complete         # Tab

# Accept autosuggestion word-by-word (optional)
if (( ${+ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGET} )); then
  bindkey '^[[1;3C' forward-word  # Alt+Right — partial accept if available
fi