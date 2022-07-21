#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nvm
if [[ -d /usr/share/nvm/init-nvm.sh ]]; then source /usr/share/nvm/init-nvm.sh; fi
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias vim='nvim'
alias vimrc='vim ~/.config/nvim/init.lua'
alias plugins='vim ~/.config/nvim/lua/plugins.lua'
alias bashrc='vim ~/.bashrc'
alias rclua='vim ~/.config/awesome/rc.lua'
alias lspconfig='vim ~/.config/nvim/lua/lsp-config.lua'
alias config-commit='config add -u && config commit -m'
alias bluetooth-on='echo "power on"; echo "connect 38:18:4C:16:A4:82"; echo "connect 38:18:4C:16:A4:82" | bluetoothctl'

# stolen from https://salferrarello.com/using-vim-view-git-commits/
alias 'git-log'="git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | nvim -R -c 'set hidden nowrap keywordprg=:enew\ \|\ terminal\ \git\ --no-pager\ show | nnoremap q :bd!<cr>' -"


PS1='[\u@\h \W]\$ '

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg  --files'
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


#starship
eval "$(starship init bash)"

# git completion
source /usr/share/bash-completion/completions/git

config config status.showUntrackedFiles no
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=nvim
# export PATH=$PATH:/home/myself/scripts/
