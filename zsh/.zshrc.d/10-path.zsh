# PATH helpers — idempotent prepend/append

typeset -U path PATH

path_prepend() {
  local dir
  for dir in "$@"; do
    [[ -d "$dir" ]] || continue
    [[ ":$PATH:" == *":${dir}:"* ]] && continue
    PATH="${dir}:$PATH"
  done
}

path_append() {
  local dir
  for dir in "$@"; do
    [[ -d "$dir" ]] || continue
    [[ ":$PATH:" == *":${dir}:"* ]] && continue
    PATH="$PATH:${dir}"
  done
}

path_prepend "$HOME/.local/bin" "$HOME/bin"
path_append "$HOME/.opencode/bin" "/opt/nvim-linux-x86_64/bin" "$HOME/.lmstudio/bin"

export PATH