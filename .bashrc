#
# ~/.bashrc
#
source /usr/share/bash-completion/completions/git

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nvm
source /usr/share/nvm/init-nvm.sh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias vim='nvim'
PS1='[\u@\h \W]\$ '

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#starship
eval "$(starship init bash)"

# git completion
source /usr/share/bash-completion/completions/git

config config status.showUntrackedFiles no
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:/home/myself/scripts/
