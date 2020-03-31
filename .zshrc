export ZSH="/home/aamaruvi/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

path+="/opt/arm-none-eabi-gcc/bin:/home/aamaruvi/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/opt/spasm:$HOME/.cargo/bin"

ulimit -n 2048

alias pros=prosv5
alias make='make -j8'

export EDITOR='nvim'

[[ -v TMUX ]] && alias clear="clear && tmux clear"
plugins=(git zsh-nvm zsh-autosuggestions zsh-syntax-highlighting)

HIST_STAMPS="mm/dd/yyyy"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,build,node_modules}"'

source $ZSH/oh-my-zsh.sh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
export GPG_TTY=$(tty)
