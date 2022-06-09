#
# ~/.bashrc
#
source /usr/share/bash-completion/completions/git

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config status.showUntrackedFiles no
alias ls='ls --color=auto'
alias vim='nvim'
PS1='[\u@\h \W]\$ '

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:/home/myself/scripts/
eval "$(starship init bash)"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
