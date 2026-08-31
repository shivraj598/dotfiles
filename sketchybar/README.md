# sketchybar

Highly customizable macOS menu bar. Replaces/augments the system menu bar with workspaces, media controls, and system widgets.

**Config directory:** `~/.config/sketchybar/` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow sketchybar
```

Requires SketchyBar, e.g.:

```bash
brew tap FelixKratz/formulae
brew install sketchybar
```

Reload it:

```bash
sketchybar --reload
```

---

## Bar Items (left → right)

### Left

- **Apple logo** (apple.lua) — click opens the app menu
- **Spaces** (spaces.lua) — `I B T 1 2 3 4 5` — mirrors AeroSpace workspaces; click to switch, shows the focused app icon per space

### Center

- **Front app** (front_app.lua) — shows the currently focused application

### Right

- **Menus** (menus.lua) — click toggles control-center-style toggles for Wi-Fi / Bluetooth / etc.
- **Widgets**:
  - **CPU** (widgets/cpu.lua)
  - **RAM** (widgets/ram.lua)
  - **Network** (widgets/network_load.lua)
  - **Volume** (widgets/volume.lua)
  - **Battery** (widgets/battery.lua) — shows percentage
  - **Wi-Fi** (widgets/wifi.lua)
- **Calendar** (calendar.lua) — time/date; **click opens the Calendar app**
- **Media** (media.lua) — now-playing module

---

## Click Actions

| Item | Click action |
|------|--------------|
| Apple logo | Opens the app menu |
| Workspace space | Switch to / focus that AeroSpace workspace |
| Menus chip | Open the toggles menu (Wi-Fi, Bluetooth, etc.) |
| Calendar | `open -a 'Calendar'` |
| Media previous | `nowplaying-cli previous` |
| Media play/pause | `nowplaying-cli togglePlayPause` |
| Media next | `nowplaying-cli next` |

---

## Integration

- **AeroSpace** triggers the custom event `aerospace_workspace_change` on workspace change → SketchyBar updates the focused space.
- Uses **SF Symbols** icon set (`icons = "sf-symbols"`) with SF Pro / SF Mono fonts.

---

## Partner configs

- AeroSpace window manager: `~/dotfiles/aerospace`
