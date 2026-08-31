# ghostty

Fast GPU-accelerated terminal emulator for macOS.

**Config file:** `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` → `~/dotfiles/ghostty/config.ghostty` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow ghostty
```

After changing the config, **fully quit and relaunch Ghostty** (`Cmd + Q`) — it loads config on startup only.

---

## Font & Appearance

| Setting | Value |
|---------|-------|
| Font family | `JetBrainsMono Nerd Font` |
| Font size | `13` |
| Background opacity | `0.20` (transparent) |
| Background blur | `true` (frosted glass) |
| Terminal type | `xterm-ghostty` |

---

## Nerd Font Icons

Forces Nerd Font icon codepoints to render correctly, including **inside tmux** (fixes icons showing as `_`):

```toml
font-codepoint-map = U+E000-U+F8FF=JetBrainsMono Nerd Font
```

This maps every Private Use Area (PUA) codepoint that Nerd Fonts use to `JetBrainsMono Nerd Font`, keeping the icons single-width and correctly scaled even when driven through tmux.

---

## Partner configs

- Starship prompt (rendered inside Ghostty): `~/dots/starship`
- tmux (run inside Ghostty): `~/dotfiles/tmux`
