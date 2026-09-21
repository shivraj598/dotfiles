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

## Vim and LazyVim-style shortcuts

These shortcuts use the VSCodeVim extension. Leader-key shortcuts start with `Space` and are available in Vim Normal mode unless noted otherwise.

| Shortcut | Action | Context |
| --- | --- | --- |
| `j` then `k` | Return to Normal mode | Insert mode |
| `Esc` | Return to Normal mode | Insert mode |
| Hold `h` | Repeat movement left | Normal mode |
| Hold `j` | Repeat movement downward | Normal mode |
| Hold `k` | Repeat movement upward | Normal mode |
| Hold `l` | Repeat movement right | Normal mode |

On macOS, VS Code uses the system key-repeat behavior for held Vim motions. The
VS Code app preference `ApplePressAndHoldEnabled=false` disables the accent menu
so holding `h`, `j`, `k`, or `l` sends repeated movement keys instead.

### Navigation

| Shortcut | Action | Context |
| --- | --- | --- |
| `Ctrl+h` | Navigate to the editor group on the left | Normal mode |
| `Ctrl+l` | Navigate to the editor group on the right | Normal mode |
| `Ctrl+k` | Navigate to the editor group above | Normal mode |
| `Ctrl+j` | Navigate to the editor group below | Normal mode |
| `Space ,` | Show all open editors | Normal mode |
| `Space e` | Toggle the sidebar and focus the file explorer | Normal mode, editor focused |
| `Space e` | Toggle the sidebar and return focus to the editor | Sidebar focused |
| `Space e` | Toggle the sidebar | Normal mode, file explorer visible |
| `s h` | Split the editor horizontally | Normal mode |
| `s v` | Split the editor vertically | Normal mode |

### Coding

| Shortcut | Action | Context |
| --- | --- | --- |
| `Space c a` | Open code actions | Normal mode, editor focused |
| `Shift+k` | Move selected lines up | Visual Line mode |
| `Shift+j` | Move selected lines down | Visual Line mode |
| `Shift+k` | Show hover documentation | Normal mode, editor focused |
| `Space c r` | Rename symbol | Normal mode, editor focused |
| `Space c s` | Go to symbol | Normal mode, editor focused |
| `Space b d` | Close the active editor | Normal mode or outside text input |
| `Space b o` | Close all other editors | Normal mode or outside text input |
| `Space Space` | Quick Open | Normal mode |
| `Space g d` | Go to definition | Normal mode, editor focused |
| `Space g r` | Go to references | Normal mode, editor focused |
| `Space g i` | Go to implementation | Normal mode, editor focused |
| `Space s g` | Search in files | Normal mode |
| `Space g g` | Open Source Control and focus its view | Normal mode |
| `Ctrl+n` | Add the next occurrence to the selection | Normal or Visual mode |

### Yank, paste, undo, and redo

VSCodeVim provides these standard Vim operators and motions directly. No extra leader-key mapping is needed for them.

| Shortcut | Action | Context |
| --- | --- | --- |
| `yy` | Yank the entire current line | Normal mode |
| `yw` / `yiw` | Yank a word or the word under the cursor | Normal mode |
| `y` | Yank the selected text | Visual mode |
| `p` / `P` | Paste after / before the cursor | Normal mode |
| `u` | Undo the last change | Normal mode |
| `Ctrl+r` | Redo the last undone change | Normal mode |
| `Space r` | Redo the last undone change | Normal mode |

### File Explorer

These shortcuts apply when the VS Code file explorer is focused and a writable resource is selected.

| Shortcut | Action |
| --- | --- |
| `r` | Rename the selected file or folder |
| `c` | Copy the selected file or folder |
| `p` | Paste into the current folder |
| `x` | Cut the selected file or folder |
| `d` | Delete the selected file or folder |
| `a` | Create a new file |
| `s` | Open the selected item to the side |
| `Shift+s` | Split the editor, open the item, and close other editors |
| `Enter` | Open a selected file and pass focus to it |
| `Enter` | Expand or collapse a selected folder |

### Debug

| Shortcut | Action | Context |
| --- | --- | --- |
| `Space d a` | Select and start a debug configuration | Normal mode, debugger available |
| `Space d t` | Stop debugging | Normal mode, active debug session |
| `Space d o` | Step over | Normal mode, paused debug session |
| `Space d b` | Toggle a breakpoint | Normal mode, editor focused |
| `Space d e` | Show the debug hover | Normal mode, paused debug session |
| `Space d c` | Continue debugging | Normal mode, paused debug session |

The complete definitions are stored in [`keybindings.json`](keybindings.json). Vim engine options such as the Space leader key, system clipboard, search behavior, and fold handling are stored in [`settings.json`](settings.json).
h