
# 1. SYSTEM ENVIRONMENT & HOMEBREW

# Load Homebrew first so system plugins work properly
eval "$(/opt/homebrew/bin/brew shellenv)"

# Only keeping Antigravity IDE path (Hermes and MiniMax removed)
export PATH="/Users/shivrajtimilsena/.antigravity-ide/antigravity-ide/bin:$PATH"
export EDITOR="code --wait"


# 2. AUTO-COMPLETION & SUGGESTIONS

# Load the native Zsh completion system for standard Tab-lists
autoload -Uz compinit && compinit -i
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Load your custom autosuggestions plugin
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

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
