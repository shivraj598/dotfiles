# karabiner

Karabiner-Elements key remapping configuration (placeholder).

**Target config directory:** `~/.config/karabiner/` (managed with GNU Stow)

## Setup

```bash
cd ~/dotfiles && stow karabiner
```

Requires Karabiner-Elements installed.

---

## Current State

This package is a **placeholder** — no rules are configured yet.

It sets up the folder structure for complex modifications:

```
~/.config/karabiner/
└── assets/
    └── complex_modifications/   ← drop rule JSON files here
```

## Adding a rule

Drop a rule JSON file into `~/.config/karabiner/assets/complex_modifications/`, then enable it in **Karabiner-Elements → Complex Modifications**.
