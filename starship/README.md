# starship

Cross-shell prompt. Loaded by zsh via `eval "$(starship init zsh)"` in `~/.zshrc`.

**Config file:** `~/.config/starship.toml` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow starship
```

Requires the Starship binary installed.

---

## Prompt Layout (left to right)

```
(python) directory on <branch> at 24h:time
❯
```

Order defined by `format`:

1. Python virtualenv (in literal parentheses, cyan)
2. Current directory
3. Git branch (white, with GitHub icon ` `)
4. Time (yellow, 24-hour `HH:MM`)
5. Line break
6. Character prompt (`❯`)

---

## Module Settings

| Module | Customization |
| -------- | --------------- |
| `[git_branch]` | Symbol = GitHub octocat ` ` (`U+F09B`), bold white |
| `[git_status]` | **Disabled** (removes the `[?]` untracked/modified indicator) |
| `[python]` | Shows `(virtualenv)` in bold cyan at start |
| `[time]` | `at HH:MM` in bold yellow |
| `[character]` | Prompt `❯` — bold green on success, bold red on error |

---

## Prompt Symbol

| State | Symbol |
|-------|--------|
| Success | `❯` (bold green) |
| Error | `❯` (bold red) |
