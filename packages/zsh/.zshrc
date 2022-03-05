export PATH=/usr/local/bin:$PATH
export EDITOR=vi
export CLICOLOR=1
export TERM=xterm-256color

if [ "$ZSH_VERSION" ] ; then

	# コマンドのスペルを訂正
	setopt correct

	########################################

	# Customize to your needs...

	# ==== エイリアス ====
	# ---- find系 ----
	alias findr='find ./ -name'

	# ---- grep系 ----
	alias g= 'lsof -i -P | '

	# sudo の後のコマンドでエイリアスを有効にする
	alias sudo='sudo '

	# グローバルエイリアス
	alias -g L='| less'
	alias -g G='| grep'

	# shellの再起動
	alias relogin='exec $SHELL -l'

	# git系 エイリアス
	alias rh='git rh'
	alias rb='git rebase -i HEAD~~'
	alias ch='git checkout'
	alias chb='ch -b'
	alias chd='ch develop'
	alias chs='ch staging'
	alias chm='ch master'
	alias b='git branch --sort=authordate'
	alias l="git log"
	alias cp='git cherry-pick'
	alias rfl='git reflog'
	alias po='git pull origin'
	alias st='git stash'
	alias stl='git stash list'
	alias stp='st pop'
	alias a='git add .'
	alias m='git merge'
	alias cm='git commit -m'
	alias cam='git commit --amend'
	alias pso='git push origin'
	alias psod='pso develop'
	alias psom='pso master'
	alias po='git pull origin'
	alias pod='po develop'
	alias pom='po master'

	# starship
	eval "$(starship init zsh)"
	export STARSHIP_CACHE=~/.starship/cache

	# zsh-autosuggestions
	export HISTFILE=${HOME}/.zsh_history
	export HISTSIZE=1000000
	export SAVEHIST=1000000

	setopt BANG_HIST
	setopt EXTENDED_HISTORY
	setopt INC_APPEND_HISTORY
	setopt SHARE_HISTORY
	setopt HIST_EXPIRE_DUPS_FIRST
	setopt HIST_IGNORE_DUPS
	setopt HIST_IGNORE_ALL_DUPS
	setopt HIST_FIND_NO_DUPS
	setopt HIST_IGNORE_SPACE
	setopt HIST_SAVE_NO_DUPS
	setopt HIST_REDUCE_BLANKS
	setopt HIST_VERIFY

	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

	eval "$(anyenv init -)"

	brew services restart yabai
	brew services restart skhd

	source ~/www/.docker-lightrc
fi
