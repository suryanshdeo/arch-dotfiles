export PATH="$HOME/.local/bin:$PATH"
source <(fzf --zsh)
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
eval "$(oh-my-posh init zsh --config ~/.poshthemes/1_shell.omp.json)"
if [[ $- == *i* ]]; then
    fastfetch --config /home/rex/.config/fish/config.jsonc
fi
autoload -U compinit && compinit -d ~/.zcompdump

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  zsh-bat
  zsh-completions
)

ZSH_THEME="nord-extended/nord"
alias thor='sudo thor-flash-utility'

export PATH=$PATH:/home/rex/.spicetify
