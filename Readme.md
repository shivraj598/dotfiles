# Dotfiles + GNU Stow

My dotfiles are managed using GNU Stow.

## Basic workflow

1. Find the application's original config
2. Move the config into `~/dotfiles`
3. Stow the package to create the symlink

---

## Table of Contents — Package Guides

Each application has its own README with setup, shortcuts, and aliases.

| Package | What it is | Its Guide |
| --------- | ----------- | ----------- |
| `aerospace` | Tiling window manager (macOS) | [README](aerospace/README.md) |
| `borders` | Focused-window borders (JankyBorders) | [README](borders/README.md) |
| `ghostty` | GPU terminal emulator | [README](ghostty/README.md) |
| `karabiner` | Key remapping (Karabiner-Elements) | [README](karabiner/README.md) |
| `sketchybar` | Custom macOS menu bar | [README](sketchybar/README.md) |
| `starship` | Cross-shell prompt | [README](starship/README.md) |
| `tmux` | Terminal multiplexer | [README](tmux/README.md) |
| `zsh` | Shell config + aliases | [README](zsh/README.md) |

> The rest of this document explains **how to add a new package** to the dotfiles with GNU Stow.

---

## 1. Config Inside `~/.config`

### Example: Aerospace

### Original config

```bash
~/.config/aerospace/
```

### Step 1 — Find the config (Aerospace)

```bash
ls -la ~/.config/aerospace
```

Or search:

```bash
find ~ -iname "*aerospace*" 2>/dev/null
```

### Step 2 — Move it to dotfiles (Aerospace)

Create the package:

```bash
mkdir -p ~/dotfiles/aerospace/.config
```

Move the config:

```bash
mv ~/.config/aerospace ~/dotfiles/aerospace/.config/
```

### Result

```text
~/dotfiles/aerospace/.config/aerospace/
```

### Step 3 — Stow it (Aerospace)

```bash
cd ~/dotfiles
stow aerospace
```

### Result01

```text
~/.config/aerospace
        ↓
     symlink
        ↓
~/dotfiles/aerospace/.config/aerospace
```

---

## 2. Config Directly in Home Directory

**Example:** `~/.claude/`

### Step 1 — Find the config (Claude)

```bash
ls -la ~/.claude
```

Or:

```bash
find ~ -maxdepth 2 -iname "*claude*" 2>/dev/null
```

### Step 2 — Move it to dotfiles (Claude)

```bash
mkdir -p ~/dotfiles/claude
mv ~/.claude ~/dotfiles/claude/
```

### Result02

```text
~/dotfiles/claude/.claude/
```

### Step 3 — Stow it (Claude)

```bash
cd ~/dotfiles
stow claude
```

### Result03

```text
~/.claude
    ↓
 symlink
    ↓
~/dotfiles/claude/.claude
```

---

## 3. Single Config File in Home Directory

**Example:** `~/.zshrc`

### Step 1 — Find the config (Zsh)

```bash
ls -la ~/.zshrc
```

### Step 2 — Move it to dotfiles (Zsh)

```bash
mkdir -p ~/dotfiles/zsh
mv ~/.zshrc ~/dotfiles/zsh/
```

### Result04

```text
~/dotfiles/zsh/.zshrc
```

### Step 3 — Stow it (Zsh)

```bash
cd ~/dotfiles
stow zsh
```

### Result05

```text
~/.zshrc
   ↓
symlink
   ↓
~/dotfiles/zsh/.zshrc
```

---

## 4. Config Outside `~/.config` and Outside `$HOME`

Some macOS applications store configuration somewhere like:

```text
~/Library/Application Support/example/
```

### Step 1 — Find the config (Custom)

```bash
find ~/Library -iname "*example*" 2>/dev/null
```

### Step 2 — Move it to dotfiles (Custom)

For a custom location, the package can be kept simple:

```text
~/dotfiles/example/
└── config
```

Move the config:

```bash
mkdir -p ~/dotfiles/example
mv "/path/to/config" ~/dotfiles/example/
```

### Step 3 — Stow with `--target` (Custom)

```bash
cd ~/dotfiles
stow --target="/path/to/original/config/directory" example
```

### Example

```bash
cd ~/dotfiles
stow --target="$HOME/Library/Application Support/com.example" example
```

---

## 5. Quick Reference

| Scenario | Original Location | Dotfiles Location | Stow Command |
| ---------- | ------------------ | ------------------- | -------------- |
| Inside `~/.config` | `~/.config/example/` | `~/dotfiles/example/.config/example/` | `stow example` |
| Directly in `$HOME` | `~/.example/` | `~/dotfiles/example/.example/` | `stow example` |
| Single file in `$HOME` | `~/.example` | `~/dotfiles/example/.example` | `stow example` |
| Custom location | Find the config | `~/dotfiles/example/` | `stow --target="ORIGINAL_LOCATION" example` |

---

## The Only Workflow to Remember

```text
1. FIND
   Where does the application store its config?
        ↓
2. MOVE
   Move the config into ~/dotfiles/PACKAGE/
        ↓
3. STOW
   cd ~/dotfiles
   stow PACKAGE
```

That's it.
