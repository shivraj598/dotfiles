# zsh

Lightweight zsh configuration for macOS with Homebrew, Git, Python venv helpers, and the Starship prompt.

**Config file:** `~/.config` → `~/dotfiles/zsh/.zshrc` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow zsh
```

Requires Zsh (default shell on macOS) and Homebrew at `/opt/homebrew`.

---

## Aliases

### File / directory

| Alias | Expands to | What it does |
| ------- | ----------- | -------------- |
| `cl` | `clear` | Clear the terminal |
| `ls` | `ls -G` | Colorful directory listing (macOS) |
| `ll` | `ls -alG` | Complete list including hidden files |
| `rmf` | `rm -rf` | Force remove any file/folder |
| `md` | `mkdir -p` | Create a folder (with missing parents) |
| `mdc <dir>` | `mkdir -p + cd` | Create a folder and enter it |

### Git

| Alias | Expands to | What it does |
| ------- | ----------- | -------------- |
| `g` | `git` | Git |
| `gs` | `git status` | Working tree status |
| `ga` | `git add` | Stage files |
| `gc "msg"` | `git commit -m "msg"` | Commit with message |
| `gp` | `git push origin HEAD` | Push current branch |
| `gcl` | `git clone` | Clone a repository |

### Navigation

| Alias | Expands to | What it does |
| ------- | ----------- | -------------- |
| `..` | `cd ..` | Go up one directory |
| `ho` | `cd ~` | Home directory |
| `pr` | `cd ~/Projects` | Projects directory |
| `co` | `cd ~/Coding` | Coding directory |
| `le` | `cd ~/Learning` | Learning directory |
| `docs` | `cd ~/Documents` | Documents directory |
| `dl` | `cd ~/Downloads` | Downloads directory |
| `dot` | `cd ~/dotfiles` | Dotfiles directory |

### Agents

| Alias | Expands to | What it does |
| ------- | ----------- | -------------- |
| `oc` | `opencode` | OpenCode agent |
| `cc` | `claude` | Claude Code agent |

---

## Functions

| Function | What it does |
| ---------- | -------------- |
| `env <name>` | Create a Python virtual environment named `<name>` |
| `act <env>` | Activate a virtual environment |
| `dec` | Deactivate the current environment |

---

## Environment

- Uses Homebrew shell env (`/opt/homebrew/bin/brew shellenv`)
- `EDITOR="code --wait"`
- History shared/appended/instant across all terminals
- zsh-autosuggestions is **disabled** (faded ghost text was distracting). Re-enable by uncommenting the two `source`/`export` lines.
- Starship prompt loaded if installed.
