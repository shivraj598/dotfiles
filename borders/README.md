# borders

JankyBorders — lightweight macOS window borders (border on the focused window). Launched automatically by AeroSpace on startup.

**Config file:** `~/.config/borders/bordersrc` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow borders
```

Requires the `borders` (JankyBorders) binary installed, e.g.:

```bash
brew install FelixKratz/formulae/borders
```

To start manually:

```bash
borders &
```

---

## Settings

| Option | Value | What it does |
|--------|-------|--------------|
| `style` | `round` | Rounded corner borders |
| `width` | `5.0` | Border thickness in px |
| `hidpi` | `on` | Crisp borders on Retina displays |
| `active_color` | `0xff90EE90` | Light green border on the focused window |
| `inactive_color` | `0x00313A31` | Transparent/invisible border on unfocused windows |
| `background_color` | `0x00000000` | Transparent background |

Color format: `0xAARRGGBB` (Alpha, Red, Green, Blue).

The focused window gets a **light green** border; all other windows have no visible border.
