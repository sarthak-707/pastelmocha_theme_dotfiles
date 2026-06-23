# Zsh behavior — fast, predictable, friendly

setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD           # push dirs on cd
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY        # merge history across sessions
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY     # timestamps in history file

setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt COMBINING_CHARS

# Sane globbing (no surprise errors on failed globs in scripts)
setopt NO_NOMATCH

# Optional: gentle typo fix on commands (comment out if annoying)
# setopt CORRECT

HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
SAVEHIST=50000
HISTSIZE=50000

bindkey -e   # emacs keybindings (default for most users)