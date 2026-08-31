# tmux

Nord-themed tmux configuration for macOS with AstroNvim and full-stack development.

**Prefix:** `Ctrl + Space` (every tmux shortcut starts with this)

## Setup

```bash
cd ~/dotfiles && stow tmux
```

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Inside tmux press `Prefix + I` to install plugins.

---

## Sessions

A session is a persistent workspace. It survives terminal close and reconnection.

### From Terminal (outside tmux)

| Command | What it does |
|---------|--------------|
| `tmux` | Start server and create default session |
| `tmux new -s name` | Create session named `name` |
| `tmux new -s name -c ~/path` | Create session in specific directory |
| `tmux ls` | List all running sessions |
| `tmux a` | Attach to last session |
| `tmux a -t name` | Attach to specific session |
| `tmux kill-session -t name` | Kill a session |
| `tmux kill-server` | Kill everything |

### Inside tmux

| Keybinding | What it does |
|------------|--------------|
| `Prefix + s` | Session selector (browse/switch sessions) |
| `Prefix + $` | Rename current session |
| `Prefix + d` | Detach (leave session running in background) |
| `Prefix + &` | Kill current session (with confirm) |

### Common Workflow

```bash
# Create a session for a project
tmux new -s dev -c ~/Projects/myapp

# Detach when you're done (session keeps running)
Prefix + d

# Later, list what's running
tmux ls

# Jump back in
tmux a -t dev
```

---

## Windows

Windows are tabs inside a session. Each window holds its own set of panes.

### Navigation

| Keybinding | What it does |
|------------|--------------|
| `Prefix + 1` | Jump to window 1 |
| `Prefix + 2` | Jump to window 2 |
| `Prefix + 3` | Jump to window 3 |
| `Prefix + 4` | Jump to window 4 |
| `Prefix + 5` | Jump to window 5 |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + Tab` | Toggle between current and last window |
| `Prefix + w` | Window selector (tree view) |

### Management

| Keybinding | What it does |
|------------|--------------|
| `Prefix + c` | Create new window (in current directory) |
| `Prefix + ,` | Rename current window |
| `Prefix + X` | Close window (with confirm) |
| `Prefix + Shift+Left` | Move window left |
| `Prefix + Shift+Right` | Move window right |

### Project Window Layout

```
 1:editor    AstroNvim
 2:servers   Frontend & backend dev servers
 3:docker    Docker, databases, logs
 4:agent     Claude Code, OpenCode, Pi
 5:shell     General terminal
```

---

## Panes

Panes split a window into multiple terminal areas.

### Navigation (no prefix needed)

| Keybinding | What it does |
|------------|--------------|
| `Ctrl + h` | Move to left pane |
| `Ctrl + j` | Move to down pane |
| `Ctrl + k` | Move to up pane |
| `Ctrl + l` | Move to right pane |

Works seamlessly between tmux panes and Neovim splits via `vim-tmux-navigator`.

### Splitting & Closing

| Keybinding | What it does |
|------------|--------------|
| `Prefix + \` | Split horizontally (side by side) |
| `Prefix + -` | Split vertically (top/bottom) |
| `Prefix + x` | Close current pane (with confirm) |

### Resize (repeatable)

Press `Prefix` once, then keep pressing the key:

| Keybinding | What it does |
|------------|--------------|
| `Prefix + H` | Resize 5px left |
| `Prefix + J` | Resize 5px down |
| `Prefix + K` | Resize 5px up |
| `Prefix + L` | Resize 5px right |

### Layouts

| Keybinding | What it does |
|------------|--------------|
| `Prefix + m` | Toggle zoom (maximize pane) |
| `Prefix + q` | Show pane numbers |
| `Prefix + =` | Tiled layout |
| `Prefix + \|` | Even horizontal layout |
| `Prefix + Space` | Cycle through layouts |
| `Prefix + y` | Toggle synchronized input to all panes |

---

## Copy Mode

| Keybinding | What it does |
|------------|--------------|
| `Prefix + [` | Enter copy mode |
| `Escape` | Exit copy mode |
| `v` | Start selection |
| `Ctrl + v` | Toggle block selection |
| `y` | Copy selection to macOS clipboard |
| `Y` | Select entire line, copy to clipboard |
| `Prefix + P` | Paste from tmux buffer |

---

## General

| Keybinding | What it does |
|------------|--------------|
| `Prefix + r` | Reload tmux config |
| `Prefix + Ctrl+Space` | Send Ctrl+Space to active pane |

---

## Status Bar

Bottom bar. Left shows session name, center shows windows, right shows time and directory.

```
  main  1:editor  2:servers  ●3:docker  4:agent  5:shell   18:45  Mon Aug 31  ~/project
```

Active window marked with `●`. Zoomed window shows `󰍉` icon.

---

## Plugins

| Plugin | Purpose |
|--------|---------|
| [tpm](https://github.com/tmux-plugins/tpm) | Plugin manager |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Pane/split navigation |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save/restore sessions |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save every 15 min |

| Keybinding | What it does |
|------------|--------------|
| `Prefix + I` | Install plugins |
| `Prefix + U` | Update plugins |
| `Prefix + Ctrl+r` | Restore last session |

---

## File Locations

```
~/.config/tmux/tmux.conf              Config (symlinked via stow)
~/.config/tmux/plugins/tpm/           TPM
~/.config/tmux/plugins/<plugin>/      Installed plugins
```

---

## References

- [tmux manual](https://github.com/tmux/tmux/wiki)
- [Nord theme](https://www.nordtheme.com/)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)
- [TPM](https://github.com/tmux-plugins/tpm)
