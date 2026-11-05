# sketchybar

Custom macOS menu bar (Lua config via SbarLua) showing AeroSpace workspaces, the focused app, media, and system widgets.

**Config directory:** `~/.config/sketchybar/` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow sketchybar
```

Requires SketchyBar:

```bash
brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar
```

Optional helpers used by some items: `nowplaying-cli` (media controls), `switchaudio-osx` (volume output picker), `sketchybar-app-font` (workspace app icons).

Reload after editing:

```bash
sketchybar --reload
```

---

## Bar Items (left → right)

### Left

- **Apple logo** (`items/apple.lua`) — click opens the app menu
- **Workspaces** (`items/spaces.lua`) — `I B T N S A 1 2`, mirrors AeroSpace. Click to switch; each pill shows icons of the apps open in that workspace. Workspaces pinned to the MacBook display only show there; the rest move to the external monitor when one is connected.
- **Front app** (`items/front_app.lua`) — name of the focused application

### Right (right → left on screen)

- **Calendar** (`items/calendar.lua`) — date and time
- **Battery** (`items/widgets/battery.lua`)
- **Volume** (`items/widgets/volume.lua`)
- **Network** (`items/widgets/wifi.lua`) — upload/download speed
- **CPU** (`items/widgets/cpu.lua`) — usage % + graph
- **RAM** (`items/widgets/ram.lua`) — usage % + graph
- **Media** (`items/media.lua`) — now playing (whitelisted players only)

---

## Click Actions

| Item | Action |
| ---- | ------ |
| Apple logo | Open the app menu |
| Workspace pill | `aerospace workspace <name>` |
| Calendar | Open Calendar.app |
| Battery | Toggle popup with remaining time |
| Volume | Click: toggle slider + output device list · Scroll: change volume |
| Network | Toggle popup with SSID, hostname, IP, mask, router (click a row to copy it) |
| CPU / RAM | Open Activity Monitor |
| Media | Toggle popup with previous / play-pause / next (`nowplaying-cli`) |

---

## Styling

Shared defaults (fonts, paddings, 9pt corner radius) live in `default.lua`; colors in `colors.lua`.

Workspace pills and the calendar use a **two-layer** look: an inner filled box wrapped by a bracket that draws the outline. To keep the outline even on all sides with no dark gaps in the corners, these values must stay in sync:

| Value | Setting | Rule |
| ----- | ------- | ---- |
| Inner box height | `background.height = 26` | — |
| Gap | `padding_left/right = 2` | — |
| Outline height | bracket `background.height = 30` | inner height + 2 × gap |
| Outline corner | bracket `background.corner_radius = 7` | — |
| Inner corner | `background.corner_radius = 5` | outline corner − gap |
| Inner border | `background.border_width = 0` | keep off |

The focused workspace only changes the outline color and width (2 → 4) and the fill color; its size never changes, so the bar doesn't shift.

The metric widgets (CPU, RAM, network, volume, battery) are a single bracket with a 1pt outline and `corner_radius = 7`.

---

## Integration

- **AeroSpace** fires `aerospace_workspace_change` on every workspace switch (`exec-on-workspace-change` in `aerospace.toml`). SketchyBar then updates the highlight and fetches all windows with one `aerospace list-windows --all` call.
- The workspace list in `items/spaces.lua` must match `persistent-workspaces` in `aerospace.toml`.
- App icons come from `helpers/app_icons.lua`; an app missing there shows the default icon.

---

## Partner configs

- AeroSpace window manager: [`aerospace/`](../aerospace/README.md)
- Window borders: [`borders/`](../borders/README.md)
