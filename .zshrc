# Paths
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/home/rex/.spicetify

# Set ZSH dir
export ZSH="$HOME/.oh-my-zsh"

# Plugin list BEFORE Oh My Zsh is sourced
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-bat
  zsh-completions
)

# Theme (just for info, doesn't affect plugin loading)
ZSH_THEME="nord-extended/nord"

# Load Oh My Zsh (AFTER plugins are defined)
source $ZSH/oh-my-zsh.sh

# Load additional tools
source <(fzf --zsh)
eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)"

# Alias
alias thor='sudo thor-flash-utility'

# Start fetch (only in interactive shell)
if [[ $- == *i* ]]; then
    fastfetch --config /home/rex/.config/fish/config.jsonc
fi

# Ensure zcompdump is loaded
autoload -U compinit && compinit -d ~/.zcompdump

