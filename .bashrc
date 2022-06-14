#
# ~/.bashrc
#
source /usr/share/bash-completion/completions/git

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nvm
if [[ -d /usr/share/nvm/init-nvm.sh ]]; then source /usr/share/nvm/init-nvm.sh; fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias vim='nvim'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias rclua='vim ~/.config/awesome/rc.lua'

# stolen from https://salferrarello.com/using-vim-view-git-commits/ -- not edited
alias 'git-log'="git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | nvim -R -c 'set hidden nowrap keywordprg=:enew\ \|\ terminal\ \git\ --no-pager\ show | nnoremap q :bd!<cr>' -"


PS1='[\u@\h \W]\$ '

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#Let's resolve this mofo

#starship
eval "$(starship init bash)"

# git completion
source /usr/share/bash-completion/completions/git

config config status.showUntrackedFiles no
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH=$PATH:/home/myself/scripts/
