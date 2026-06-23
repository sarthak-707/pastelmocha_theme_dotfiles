# pastelmocha_theme_dotfiles

Config files for my GNOME pastel / Catppuccin Mocha rice.

## Layout

| Path | Install to |
|------|------------|
| `ghostty/config` | `~/.config/ghostty/config` |
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `fastfetch/config.jsonc` | `~/.config/fastfetch/config.jsonc` |
| `fontconfig/fonts.conf` | `~/.config/fontconfig/fonts.conf` |
| `openbar/openbar` | Open Bar extension settings export (see extension docs) |
| `gtk-3.0/settings.ini` | `~/.config/gtk-3.0/settings.ini` |
| `gtk-4.0/settings.ini` | `~/.config/gtk-4.0/settings.ini` |
| `gnome-interface.txt` | Reference for `gsettings org.gnome.desktop.interface` |
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.zshenv` | `~/.zshenv` (optional) |
| `zsh/.zshrc.d/*.zsh` | `~/.zshrc.d/` (numbered fragments) |

## Quick install (copy)

```bash
REPO="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.config/ghostty ~/.config/kitty ~/.config/fastfetch ~/.config/fontconfig
cp "$REPO/ghostty/config" ~/.config/ghostty/
cp "$REPO/kitty/kitty.conf" ~/.config/kitty/
cp "$REPO/starship/starship.toml" ~/.config/
cp "$REPO/fastfetch/config.jsonc" ~/.config/fastfetch/
cp "$REPO/fontconfig/fonts.conf" ~/.config/fontconfig/
cp "$REPO/gtk-3.0/settings.ini" ~/.config/gtk-3.0/
cp "$REPO/gtk-4.0/settings.ini" ~/.config/gtk-4.0/
fc-cache -fv
```

Starship: this repo's Zsh setup uses `eval "$(starship init zsh)"` in `zsh/.zshrc.d/40-prompt.zsh`.

### Zsh only

```bash
REPO="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.zshrc.d
cp "$REPO/zsh/.zshrc" ~/.zshrc
cp "$REPO/zsh/.zshenv" ~/.zshenv 2>/dev/null || true
cp "$REPO/zsh/.zshrc.d/"*.zsh ~/.zshrc.d/
```

Optional: `fzf-tab` under `~/.local/share/zsh/plugins/fzf-tab` for fuzzy Tab completion. Fedora packages: `zsh-autosuggestions`, `zsh-syntax-highlighting`, `starship`, `eza`, `bat`, `fd`, `fzf`, `zoxide`.

## External themes (not in this repo)

- GTK: `ct-teal-Teal-Dark-Compact` under `~/.themes/`
- Icons: `col_pastel_blue-Blue-Light` under `~/.icons/`
- Cursors: `Colloid-Pastel-cursors-light`