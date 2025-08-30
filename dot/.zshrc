export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
. "$HOME/.cargo/env"

alias ls='eza --color=always --group-directories-first'
alias ll='eza -alF --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias cat='bat'

export VISUAL=nvim
export EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"
