
# 1. SYSTEM ENVIRONMENT & HOMEBREW

# Set locale to UTF-8 for proper Unicode/Nerd Font rendering in tmux
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Load Homebrew first so system plugins work properly
eval "$(/opt/homebrew/bin/brew shellenv)"

# Only keeping Antigravity IDE path (Hermes and MiniMax removed)
export PATH="/Users/shivrajtimilsena/.antigravity-ide/antigravity-ide/bin:$PATH"
export EDITOR="code --wait"


# 2. AUTO-COMPLETION & SUGGESTIONS

# Load the native Zsh completion system for standard Tab-lists
autoload -Uz compinit && compinit -i
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# zsh-autosuggestions — Real-time command suggestions as you type
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Strategy: only suggest from history (faster, smarter)
export ZSH_AUTOSUGGEST_STRATEGY=(history)

# CRITICAL: Only Tab accepts suggestions (prevents typing interference bugs)
bindkey '^I' autosuggest-accept

# Make suggestions subtle (dark gray, not distracting)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Don't clear suggestion when backspacing (better UX)
export ZSH_AUTOSUGGEST_CLEAR_ON_EDIT=0

# 3. HISTORY CONFIGURATION

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY       # Share commands across all Ghostty windows
setopt APPEND_HISTORY      # Append instead of overwrite
setopt INC_APPEND_HISTORY  # Save instantly


# 4. LIGHTWEIGHT ALIASES

alias cl="clear"
alias ls="ls -G"          # Colorful directory listings on macOS
alias ll="ls -alG"        # Complete list including hidden files
alias rmf="rm -rf"        # Force remove any file or folder (empty or non-empty)
alias md="mkdir -p"        # Create a new folder (and any missing parent folders)
mdc() { mkdir -p "$1" && cd "$1"; } # Create a new folder and instantly enter it

#git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin HEAD"
alias gcl="git clone"
#cd
alias ..="cd .."
alias ho="cd ~"          # Go to home directory
alias pr="cd ~/Projects"  # Go to Projects directory
alias co="cd ~/Coding"  # Go to Coding directory
alias le="cd ~/Learning"  # Go to Learning directory
alias docs="cd ~/Documents"  # Go to Documents directory
alias dl="cd ~/Downloads"  # Go to Downloads directory
alias dot="cd ~/dotfiles"  # Go to dotfile directory
# 5. PYTHON VIRTUAL ENVIRONMENTS

# Create a new environment with a custom name
env() { python3 -m venv "$1"; }

# Activate a specific environment by name
act() { source "$1/bin/activate"; }

# Deactivate the current environment
alias dec="deactivate"


# 6. THE PROMPT ENGINE (Starship)

# This stays idle safely until you install Starship next
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

export PATH="$HOME/.local/bin:$PATH"

export VIRTUAL_ENV_DISABLE_PROMPT=1

export PATH="/opt/homebrew/bin:$PATH"



#agent harness
alias oc='opencode'
alias cc='claude'
