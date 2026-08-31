# Tmux Configuration & Keybindings Reference

**Prefix:** `Ctrl + Space`

---

## Quick Navigation

- [Sessions](#sessions)
- [Windows](#windows)
- [Panes](#panes)
- [Navigation](#navigation)
- [Copy & Clipboard](#copy--clipboard)
- [Status Bar](#status-bar)
- [Tips & Tricks](#tips--tricks)
- [General Tmux Commands](#general-tmux-commands-terminal)
- [Plugins](#plugins)

---

## SESSIONS

Sessions are independent tmux workspaces that maintain windows and panes. Sessions persist even after you close your terminal (with `tmux-continuum` auto-saving every 15 minutes).

### Session Keybindings

| Keybinding | Action |
|-----------|--------|
| `Prefix + s` | Open session selector (browse and switch) |
| `Prefix + $` | Rename current session |
| `Prefix + d` | Detach from current session (keep running) |
| `Prefix + &` | Kill current session (with confirmation) |

### Create Sessions (Terminal Commands)

```bash
tmux new-session -s myproject          # Create new session named "myproject"
tmux new -s work                       # Shorthand: Create new session "work"
tmux new-s dev -c ~/projects/myapp     # Create session in specific directory
tmux new-s editor -x 200 -y 50         # Create with specific size (200x50)
```

### List Sessions

```bash
tmux ls                                # List all active sessions
tmux list-sessions                     # Full command name
```

**Example output:**
```
main: 5 windows (created Wed Aug 31 18:40)
work: 3 windows (created Wed Aug 31 14:22)
dev: 1 window (created Wed Aug 31 15:10)
```

### Attach to Sessions

```bash
tmux attach                            # Attach to last session (if one exists)
tmux attach-session -t main            # Attach to "main" session
tmux attach -t work                    # Shorthand
tmux attach -t main:1                  # Attach to specific window (1) in session
```

### Rename Sessions

**Inside tmux:**
```
Prefix + $                             # Rename current session interactively
```

**From terminal:**
```bash
tmux rename-session -t oldname newname
tmux rename-s main production          # Shorthand: rename "main" to "production"
```

### Kill/Delete Sessions

**Inside tmux:**
```
Prefix + &                             # Kill current session (with confirmation)
```

**From terminal:**
```bash
tmux kill-session -t sessionname       # Kill specific session
tmux kill-session -t dev               # Example: kill "dev" session
tmux kill-server                       # DANGER: Kill tmux server (all sessions)
```

### Detach & Re-enter

**Detach from session (keeps it running):**
```
Prefix + d                             # Detach from current session
```

**Re-enter after detaching:**
```bash
tmux attach                            # Attach to last accessed session
tmux attach -t sessionname             # Attach to specific session
```

### Session Management Workflow

```bash
# Create a new project session
tmux new-s myproject -c ~/projects/myapp

# Work in that session (add windows, etc.)
Prefix + c    # Create windows as needed

# Detach when done (session keeps running)
Prefix + d

# Later, list sessions
tmux ls

# Re-attach to your work
tmux attach -t myproject

# Or switch within tmux
Prefix + s    # Select from session list
```

### Pro Tips

**Auto-attach with fallback:**
```bash
tmux attach-session -t main || tmux new-session -s main
# Attaches to "main" if it exists, creates it if not
```

**Create and attach in one command:**
```bash
tmux new-session -s work -d    # Create detached (-d flag)
# Do something...
tmux attach -t work            # Then attach when ready
```

**Restore last session after restart:**
```
Prefix + Ctrl + r    # Restore with tmux-resurrect plugin
```

> **Tip:** Sessions persist even after detaching. The `tmux-continuum` plugin auto-saves every 15 minutes and can auto-restore on startup.

---

## WINDOWS

Windows are separate workspaces within a session. Each window can have multiple panes.

### Create & Manage Windows

| Keybinding | Action |
|-----------|--------|
| `Prefix + c` | Create new window (in current directory) |
| `Prefix + ,` | Rename current window |
| `Prefix + X` | Close current window (with confirmation) |

### Window Navigation

| Keybinding | Action |
|-----------|--------|
| `Prefix + 1` to `Prefix + 5` | Jump to window 1-5 |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + w` | Window selector (live preview) |
| `Prefix + Tab` | Toggle between current and last window |

### Move & Reorder Windows

| Keybinding | Action |
|-----------|--------|
| `Prefix + Shift + Left` | Move window left (repeatable) |
| `Prefix + Shift + Right` | Move window right (repeatable) |

### Recommended Project Structure

```
Session: main
├─ 1:editor    → AstroNvim / Text Editor
├─ 2:servers   → Frontend & Backend Dev Servers
├─ 3:docker    → Docker, Databases, Logs
├─ 4:agent     → Claude Code, OpenCode, Pi
└─ 5:shell     → General Project Terminal
```

---

## PANES

Panes are split areas within a window. You can have multiple panes showing different content side-by-side or stacked.

### Create Panes

| Keybinding | Action |
|-----------|--------|
| `Prefix + \` | Split horizontally (side by side) |
| `Prefix + -` | Split vertically (top/bottom) |

### Close Panes

| Keybinding | Action |
|-----------|--------|
| `Prefix + x` | Close current pane (with confirmation) |

### Pane Zoom

| Keybinding | Action |
|-----------|--------|
| `Prefix + m` | Toggle maximize/zoom pane |
| `Prefix + q` | Display pane numbers |

---

## NAVIGATION

### Pane Navigation (Seamless with Neovim)

Navigate between tmux panes and Neovim splits seamlessly using `vim-tmux-navigator`:

| Keybinding | Action |
|-----------|--------|
| `Ctrl + h` | Move to left pane/split |
| `Ctrl + j` | Move down to pane/split |
| `Ctrl + k` | Move up to pane/split |
| `Ctrl + l` | Move to right pane/split |

> **No prefix needed!** These bindings work everywhere.

### Pane Resizing (Repeatable)

Press `Prefix` once, then hold and repeat H/J/K/L:

| Keybinding | Action |
|-----------|--------|
| `Prefix + Shift + H` | Resize pane 5px left (repeatable) |
| `Prefix + Shift + J` | Resize pane 5px down (repeatable) |
| `Prefix + Shift + K` | Resize pane 5px up (repeatable) |
| `Prefix + Shift + L` | Resize pane 5px right (repeatable) |

### Pane Layouts

| Keybinding | Action |
|-----------|--------|
| `Prefix + =` | Tiled layout (distribute all panes evenly) |
| `Prefix + \|` | Even horizontal (panes side by side) |
| `Prefix + Space` | Cycle through available layouts |

### Pane Synchronization

| Keybinding | Action |
|-----------|--------|
| `Prefix + y` | Toggle synchronized input (all panes receive keystrokes) |

> **Warning:** When synchronized, every keystroke is sent to ALL panes in the window. Useful for running same commands in multiple containers.

---

## COPY & CLIPBOARD

Vim-style keybindings for text selection and copying to macOS clipboard.

### Enter & Exit Copy Mode

| Keybinding | Action |
|-----------|--------|
| `Prefix + [` | Enter copy mode |
| `Escape` | Exit copy mode |

### Text Selection (in Copy Mode)

| Keybinding | Action |
|-----------|--------|
| `v` | Start text selection |
| `Ctrl + v` | Toggle block/rectangular selection |
| `y` | Copy selection to clipboard & exit |
| `Y` | Select entire line, copy & exit |

### Quick Copy Methods

| Method | Action |
|--------|--------|
| **Mouse drag** | Click and drag to select, release to copy |
| `Prefix + P` | Paste most recent tmux buffer |

---

## STATUS BAR

The status bar is located at the bottom of the terminal (SketchyBar occupies the top).

### Status Bar Layout

```
 SESSION_NAME  1:editor  2:servers  ●3:docker  4:agent  5:shell   18:45  Mon Aug 31 ~/project
```

- **Left:** Current session name in bold green
- **Center:** All windows, active window marked with cyan bullet (●)
- **Right:** Time, date, and current project directory

### Command Prompt & Input Bar

When you press `Prefix + :` to enter a command, or rename a window/session, the input bar uses clean, minimal styling:

- **Background:** Dark gray (#2E3440) matching terminal aesthetics (like Ghostty)
- **Text:** Cyan (#88C0D0) for clear visibility
- **Style:** Bold for emphasis

This keeps the input bar consistent with the overall design.

### Color Scheme (Nord Theme)

| Element | Color | Hex |
|---------|-------|-----|
| Session name | Green | #A3BE8C |
| Active window | Cyan (bold) | #88C0D0 |
| Inactive window | Light gray | #ABB2BF |
| Activity indicator | Cyan (bold) | #81A1C1 |
| Time | Cyan | #88C0D0 |
| Date | Light gray | #ABB2BF |
| Project path | Cyan | #81A1C1 |
| Command prompt bg | Dark gray | #2E3440 |
| Command prompt text | Cyan | #88C0D0 |
| Pane borders (inactive) | Very dark gray | #2E3440 |
| Pane borders (active) | Green | #A3BE8C |

### Pane Appearance

| Element | Color | Hex |
|---------|-------|-----|
| Active pane border | Green | #A3BE8C |
| Inactive pane border | Very dark gray | #2E3440 |

---

## TIPS & TRICKS

### View All Panes with Numbers

```
Prefix + q     # Shows pane numbers for 1.5 seconds
Prefix + 0    # Press number to select that pane
```

### Send Command to All Panes

```
Prefix + y              # Toggle synchronize-panes ON
# Type your command...
Prefix + y              # Toggle OFF when done
```

### Copy Large Text or Logs

```
Prefix + [          # Enter copy mode
G                   # Jump to end (Vim binding)
g                   # Jump to start (Vim binding)
/search_term        # Search forward
?search_term        # Search backward
n / N               # Next / Previous match
v                   # Start selection
y                   # Copy selection
```

### Restore Previous Session

Sessions are auto-saved every 15 minutes by `tmux-continuum`. On tmux startup, you can restore:

```
tmux attach         # Attach to last session
Prefix + s          # Or choose from saved sessions
```

### Maximize Pane Temporarily

```
Prefix + m          # Zoom in
# Work on full pane...
Prefix + m          # Zoom out to restore layout
```

### Check Active Pane Command

```
Prefix + q          # View pane numbers and see which pane is #P
```

### Move Between Pane Borders (without prefix)

This is handled by `vim-tmux-navigator` - no tmux prefix needed:

```
Ctrl + h/j/k/l      # Move left/down/up/right across splits and panes
```

---

## PLUGINS

### 1. TPM (Tmux Plugin Manager)

Package manager for tmux plugins.

- **Config location:** `~/.tmux/plugins/tpm`
- **Install:** Clone the TPM repository

### 2. vim-tmux-navigator

Seamless navigation between Neovim splits and tmux panes.

| Feature | Behavior |
|---------|----------|
| Navigation | `Ctrl + h/j/k/l` works everywhere |
| Zoom support | Respects pane zoom state when moving |
| Smart detection | Automatically detects panes vs splits |

**Install:**
```bash
set -g @plugin 'christoomey/vim-tmux-navigator'
```

### 3. tmux-resurrect

Save and restore tmux sessions, windows, panes, and working directories.

| Feature | Config |
|---------|--------|
| Pane contents | `@resurrect-capture-pane-contents "on"` |
| Neovim sessions | `@resurrect-strategy-nvim "session"` |
| Processes | `nvim vim docker claude opencode pi` |

**Restore:**
```bash
Prefix + Ctrl + r     # Restore last saved session
```

### 4. tmux-continuum

Auto-saves tmux state periodically.

| Setting | Value |
|---------|-------|
| Save interval | Every 15 minutes |
| Auto-restore | Currently disabled (enable after testing) |

> Uncomment `set-option -g @continuum-restore "on"` in config to auto-restore on startup.

---

## REFERENCE

### Configuration Reload

| Keybinding | Action |
|-----------|--------|
| `Prefix + r` | Reload tmux configuration (shows confirmation) |

### Mouse Support

- ✅ Select panes by clicking
- ✅ Select windows by clicking
- ✅ Resize panes by dragging borders
- ✅ Scroll in panes
- ✅ Copy text by dragging

### File Locations

```
Config file:    ~/.config/tmux/tmux.conf
Plugins:        ~/.tmux/plugins/
TPM:           ~/.tmux/plugins/tpm
Sessions:       Stored automatically by tmux-continuum
```

### Key Binding Modes

| Mode | Keybinding | Purpose |
|------|-----------|---------|
| Normal | `Prefix + [key]` | General tmux commands |
| Copy | `v`, `y`, `Y` | Text selection and copying |
| Command | `Prefix + :` | Direct tmux commands |

---

## TROUBLESHOOTING

### Colors not showing correctly

```bash
# Check terminal support
echo $TERM

# Should output: xterm-ghostty or tmux-256color
# If not, update your terminal config
```

### Plugins not loading

```bash
# Check TPM installation
ls ~/.tmux/plugins/tpm

# If missing, install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload tmux config
Prefix + r

# Install plugins
Prefix + I
```

### Keybindings not working

```bash
# Check for conflicts
tmux list-keys

# Check config syntax
tmux source-file ~/.config/tmux/tmux.conf
```

---

## GENERAL TMUX COMMANDS (Terminal)

Commands to run in your terminal shell (not inside tmux). These manage tmux from outside.

### Server Management

| Command | Action |
|---------|--------|
| `tmux` | Start tmux server (if not running) |
| `tmux kill-server` | Kill all sessions and exit tmux |
| `tmux list-commands` | List all available tmux commands |
| `tmux show-environment` | Show tmux environment variables |

### Session Management (from Terminal)

| Command | Action |
|---------|--------|
| `tmux ls` | List all sessions |
| `tmux list-sessions` | Full command name for listing |
| `tmux new-session -s NAME` | Create new session named NAME |
| `tmux new -s NAME -c PATH` | Create session in specific directory |
| `tmux new -s NAME -d` | Create session detached (not attached) |
| `tmux attach -t NAME` | Attach to existing session |
| `tmux attach-session -t NAME` | Full command name |
| `tmux rename-session -t OLD NEW` | Rename session |
| `tmux kill-session -t NAME` | Kill specific session |
| `tmux attach \|\| tmux new` | Attach or create if doesn't exist |

### Window Management (from Terminal)

| Command | Action |
|---------|--------|
| `tmux list-windows -t SESSION` | List windows in session |
| `tmux new-window -t SESSION` | Create window in session |
| `tmux kill-window -t SESSION:WINDOW` | Kill specific window |
| `tmux select-window -t SESSION:WINDOW` | Select window |

### Pane Management (from Terminal)

| Command | Action |
|---------|--------|
| `tmux list-panes -t SESSION` | List panes in session |
| `tmux kill-pane -t SESSION:WINDOW.PANE` | Kill specific pane |

### Configuration & Info

| Command | Action |
|---------|--------|
| `tmux source-file ~/.config/tmux/tmux.conf` | Reload config file |
| `tmux show-options` | Display all options |
| `tmux list-keys` | Display all keybindings |
| `tmux show-window-options` | Display window options |

### Running Commands in Sessions (from Terminal)

```bash
# Send command to a session without attaching
tmux send-keys -t sessionname "command here" Enter

# Example: Run npm start in background session
tmux send-keys -t servers "npm start" Enter

# Example: Run docker-compose up
tmux send-keys -t docker "docker-compose up" Enter

# Run command and capture output
tmux capture-pane -t sessionname -p > output.txt
```

### Scripting & Automation

```bash
# Create session with multiple windows and run commands
tmux new-session -d -s myproject -c ~/projects/myapp
tmux new-window -t myproject -n servers
tmux new-window -t myproject -n docker

# Send commands to specific windows
tmux send-keys -t myproject:servers "npm start" Enter
tmux send-keys -t myproject:docker "docker-compose up" Enter

# Attach when ready
tmux attach -t myproject
```

### Useful Alias Examples

Add to your `.zshrc` or `.bashrc`:

```bash
# Quick tmux commands
alias tls="tmux ls"                                    # List sessions
alias tnew="tmux new-session -s"                      # New session
alias ta="tmux attach-session -t"                     # Attach to session
alias tk="tmux kill-session -t"                       # Kill session
alias tsrc="tmux source-file ~/.config/tmux/tmux.conf" # Reload config

# Quick aliases for common workflows
alias work="tmux attach -t work || tmux new -s work"  # Attach or create
alias dev="tmux attach -t dev || tmux new -s dev"     # Dev session
```

After adding aliases, reload shell:
```bash
source ~/.zshrc
```

Then use:
```bash
tls                  # List all sessions
tnew myproject       # Create new session
ta work              # Attach to work session
tk dev               # Kill dev session
tsrc                 # Reload tmux config
work                 # Smart attach/create work session
```

---

- [Tmux GitHub](https://github.com/tmux/tmux/wiki)
- [Nord Theme](https://www.nordtheme.com/)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)
- [TPM - Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
