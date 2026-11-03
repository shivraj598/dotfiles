# aerospace

Tiling window manager for macOS (AeroSpace). All shortcuts use `Option` as the modifier.

**Config file:** `~/.config/aerospace/aerospace.toml` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow aerospace
```

AeroSpace starts at login and auto-reloads the config when saved.

---

## Workspaces

| Workspace | Purpose |
| ----------- | --------- |
| `I` | IDE |
| `B` | Browser |
| `T` | Terminal |
| `N` | Notes (Apple Notes, Obsidian, Notion) |
| `S` | Socials (WhatsApp, Telegram, Discord, etc.) |
| `A` | AI / Chatbots (Claude, ChatGPT, Copilot) + Microsoft Office |
| `1`–`2` | Additional workspaces |

---

## Main Mode Shortcuts (`Option` + ...)

### Window layouts

| Shortcut | Action |
| ---------- | -------- |
| `Opt + /` | Toggle tiled layout orientation |
| `Opt + ,` | Toggle accordion layout orientation |
| `Opt + F` | Fullscreen toggle |
| `Opt + Shift + Space` | Toggle focused window floating/tiling |
| `Opt + =` | Balance sizes of all tiled windows |

### Focus windows

| Shortcut | Action |
| ---------- | -------- |
| `Opt + H` | Focus left |
| `Opt + J` | Focus down |
| `Opt + K` | Focus up |
| `Opt + L` | Focus right |

### Move windows

| Shortcut | Action |
| --------------- | ----------------- |
| `Opt + Shift + H` | Move window left |
| `Opt + Shift + J` | Move window down |
| `Opt + Shift + K` | Move window up |
| `Opt + Shift + L` | Move window right |

### Resize windows

| Shortcut | Action |
| ---------- | -------- |
| `Opt + -` | Resize window -50 |
| `Opt + Shift + =` | Resize window +50 |

### Switch workspaces

| Shortcut | Action |
| ---------- | -------- |
| `Opt + I` | IDE workspace |
| `Opt + B` | Browser workspace |
| `Opt + T` | Terminal workspace |
| `Opt + N` | Notes workspace |
| `Opt + S` | Socials workspace |
| `Opt + A` | AI / Chatbots workspace |
| `Opt + 1`–`2` | Additional workspaces 1–2 |

### Move windows to workspaces

| Shortcut | Action |
| ---------- | -------- |
| `Opt + Shift + I` | Move window to IDE and follow |
| `Opt + Shift + B` | Move window to Browser and follow |
| `Opt + Shift + T` | Move window to Terminal and follow |
| `Opt + Shift + N` | Move window to Notes and follow |
| `Opt + Shift + S` | Move window to Socials and follow |
| `Opt + Shift + A` | Move window to AI / Chatbots and follow |
| `Opt + Shift + 1`–`2` | Move window to workspace 1–2 and follow |

### Workspace navigation

| Shortcut | Action |
| ---------- | -------- |
| `Opt + Tab` | Previous / current workspace |
| `Opt + Shift + Tab` | Move workspace to next monitor |

---

## Service Mode (enter with `Opt + Shift + ;`)

| Shortcut | Action |
| ---------- | -------- |
| `Esc` | Reload config, return to main |
| `R` | Flatten workspace tree |
| `F` | Toggle floating/tiling |
| `Backspace` | Close all windows but current |
| `H` / `J` / `K` / `L` | Join window with container left/down/up/right |

---

## Automatic App Assignment

- **Terminals** (Ghostty, Terminal, iTerm2, WezTerm) → `T`
- **IDEs** (VS Code, Cursor, Zed, VSCodium, Windsurf, Antigravity, T3 Code, iPhone Simulator) → `I`
- **Browsers** (Safari, Chrome, Brave, Arc, Chromium, Zen) → `B`
- **Notes** (Apple Notes, Obsidian, Zotero, Notion, Bear, Notability, Evernote, OneNote) → `N`
- **Socials** (WhatsApp, Telegram, Discord, Slack, Signal, WeChat, FaceTime) → `S`
- **AI / Office** (Claude, ChatGPT, Gemini, Copilot, Cline, OpenCode, Ollama, Word, Excel, PowerPoint, Outlook) → `A`
- **Floating** on the current workspace: Finder, System Settings, Shottr, AppCleaner, Pearcleaner, LinearMouse, Tailscale, Dropzone, Purge, MacPacker

Find an app's ID with `osascript -e 'id of app "AppName"'`.

## Monitors and integrations

- `I`, `B`, `T`, `S` are forced to the MacBook display; `N`, `A`, `1`, `2` prefer the external monitor and fall back to the MacBook
- Launches **JankyBorders** (`borders`) on startup
- Triggers a **SketchyBar** `aerospace_workspace_change` event on workspace switch (workspace list must match `sketchybar/items/spaces.lua`)
