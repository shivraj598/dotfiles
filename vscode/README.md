# vscode

VS Code user-level settings and keybindings for macOS.

**Config files:** `~/Library/Application Support/Code/User/{settings,keybindings}.json` → `~/dotfiles/vscode/` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles
stow --target="$HOME/Library/Application Support/Code/User" vscode
```

## Editing

- **From VS Code:** `Cmd+,` (Settings GUI) or `Cmd+Shift+P` → "Open Settings/Keyboard Shortcuts (JSON)" writes straight through the symlink into `~/dotfiles/vscode/`.
- **From the repo:** edit `settings.json` / `keybindings.json` directly — changes appear in VS Code instantly.
- No re-stow needed for content edits. Re-run `stow vscode` only when adding/removing files in the package.

> Note: `dotfiles/.vscode/` is the **repo-local** config for opening the dotfiles repo itself in VS Code — it is unrelated to this `vscode` package.