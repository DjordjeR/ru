# Add custom scripts
PATH="$HOME/.local/bin:$PATH"
# Path to your Oh My Zsh installation
export ZSH="$ZDOTDIR/ohmyzsh"

# Enable Spaceship prompt async and newline at the end
SPACESHIP_PROMPT_ASYNC=true
SPACESHIP_PROMPT_ADD_NEWLINE=true

# Configure Spaceship prompt order
SPACESHIP_PROMPT_ORDER=(
    time
    user
    dir
    git
    line_sep
    char
)

# Set theme to Spaceship
ZSH_THEME="spaceship"

# Plugin setup (zsh-vi-mode first)
plugins=(git zsh-autosuggestions)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Setup fzf keybindings and completion
source <(fzf --zsh)

# Zoxide for smart directory jumping
eval "$(zoxide init zsh)"

# Aliases
alias vim=nvim

# Enable persistent history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY SHARE_HISTORY

